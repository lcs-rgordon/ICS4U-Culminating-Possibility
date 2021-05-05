//
//  LindemayerSystemSketch.swift
//  Animation
//
//  Created by Russell Gordon on 2021-05-04.
//

import Foundation
import CanvasGraphics

// Make code in the L-System more readable...
typealias Predecessor = Character

// What replaces a predecessor in an L-system
struct Successor {
    
    // The likelihood of this successor being applied, when combined with other successors assigned to a given predecessor
    let odds: Int
    
    // The text that replaces the predecessor in the L-system's word
    let text: String
}

// NOTE: This is a completely empty sketch; it can be used as a template.
class LindenmayerSystemSketch: NSObject, Sketchable {
    
    // NOTE: Every sketch must contain an object of type Canvas named 'canvas'
    //       Therefore, the line immediately below must always be present.
    var canvas: Canvas
    
    // Tortoise to draw with
    let turtle: Tortoise
    
    // MARK: L-system state
    
    // What the system will draw, without any re-writes based upon production rules
    let axiom: String
    
    // What the system will draw, after re-writes based upon production rules
    var word: String
    
    // How many times to re-write the word, based upon production rules
    let generations: Int
    
    // The rules the define how the word is re-written with each new generation
    let rules: [Predecessor: [Successor]]
    
    // MARK: L-system rendering instructions
    
    // The length of the line segments used when drawing the system, at generation 0
    var length: Double
    
    // The factor by which to reduce the initial line segment length after each generation / word re-write
    let reduction: Double
    
    // The angle by which the turtle will turn left or right; in degrees.
    let angle: Degrees
    
    // Where the turtle begins drawing on the canvas
    let initialPosition: Point
    
    // The initial direction of the turtle
    let initialHeading: Degrees
    
    // This function runs once
    override init() {
        
        // MARK: Canvas and turtle setup
        
        // Create canvas object – specify size
        canvas = Canvas(width: 500, height: 500)
        
        // Draw slowly
        canvas.framesPerSecond = 15
        
        // Create turtle to draw with
        turtle = Tortoise(drawingUpon: canvas)
        
        // MARK: Initialize L-system state
        
        // What the system will draw, without any re-writes based upon production rules
        axiom = "F-F-F-F-"
        
        // DEBUG: What's the word?
        print("Axiom is:")
        print("\(axiom)")
        
        // Generation 0 – we begin with the word the same as the axiom
        word = axiom
        
        // How many times to re-write the word, based upon production rules
        generations = 2
        
        // The rules the define how the word is re-written with each new generation
        rules = [
            "F" : [
                Successor(odds: 1, text: "FFF+FF-FF+FF-FFF")
            ],
        ]
        
        // Only write a new word if there are more than 0 generations
        if generations > 0 {
            
            // Re-write the word
            for generation in 1...generations {
                
                // Create an empty new word
                var newWord = ""
                
                // Replace each character in the word, based on the production rules
                for character in word {
                    
                    // When successor rule(s) exist for a predecessor character, use them...
                    if let ruleSet = rules[character] {
                        
                        // When there is only one possible sucessor for the predecessor, just do the straight replacement
                        if ruleSet.count == 1 {
                            
                            newWord.append(ruleSet.first!.text)
                            
                        } else {
                            
                            // There are multiple possible rules that could be applied
                            // Use odds...
                            var total = 0
                            for rule in ruleSet {
                                total += rule.odds
                            }
                            
                            // Get a random integet between 1 and the total odds for this rule set
                            let randomValue = Int.random(in: 1...total)
                            
                            // Find the correct successor rule to apply
                            var runningTotal = 0
                            for rule in ruleSet {
                                runningTotal += rule.odds
                                
                                // See if this current rule is the one to be applied
                                if randomValue <= runningTotal {
                                    newWord.append(rule.text)
                                    break // Stop searching for a successor rule
                                }
                            }
                            
                        }
                        
                    } else {
                        
                        // No successor rules exist for the current predecessor character
                        // So, just copy the predecessor character, as is, to the new word
                        newWord.append(String(character))
                    }
                    
                    
                }
                
                // Replace the old word with the new word
                word = newWord
                print("After generation \(generation) the word is:")
                print(word)
                
            }
            
        }
        
        // MARK: Initialize L-system rendering instructions
        
        // The length of the line segments used when drawing the system, at generation 0
        length = 180
        
        // The factor by which to reduce the initial line segment length after each generation / word re-write
        reduction = 9
        
        // The angle by which the turtle will turn left or right; in degrees.
        angle = 90
        
        // Where the turtle begins drawing on the canvas
        initialPosition = Point(x: 250, y: 100)
        
        // The initial direction of the turtle
        initialHeading = 90
        
        // MARK: Prepare for rendering L-system
        
        // Set the length based on number of generations
        if generations > 0 {
            for _ in 1...generations {
                length /= reduction
            }
        }
        
        // Move to designated starting position
        turtle.penUp()
        turtle.setPosition(to: initialPosition)
        turtle.setHeading(to: initialHeading)
        turtle.penDown()
        
        // DEBUG:
        print("\nNow rendering...\n")
    }
    
    // This function runs repeatedly, forever, to create the animated effect
    func draw() {
        
        // Only run rendering logic once
        if canvas.frameCount == 0 {

            for character in word {
                
                // DEBUG: What character is being rendered?
                print(character)
             
                // Render based on this character
                switch character {
                case "0", "1", "2", "3", "4", "5", "6", "7", "8", "9":
                    // Placeholder for changing colour
                    break
                case "+":
                    // Turn to the left
                    turtle.left(by: angle)
                    print("Turn left\n")
                case "-":
                    // Turn to the right
                    turtle.right(by: angle)
                    print("Turn right\n")
                case "[":
                    // Save position and heading
                    turtle.saveState()
                    print("Save current state (position and heading)\n")
                case "]":
                    // Restore position and heading
                    turtle.restoreState()
                    print("Restore most recently saved state from stack (position and heading)\n")
                default:
                    // Any other character means move forward
                    turtle.forward(steps: Int(round(length)))
                    print("Forward\n")
                    break
                }
                
            }
            
        }
        

    }
    
}
