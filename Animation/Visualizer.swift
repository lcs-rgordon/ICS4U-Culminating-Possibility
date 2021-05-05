//
//  LindemayerSystemSketch.swift
//  Animation
//
//  Created by Russell Gordon on 2021-05-04.
//

import Foundation
import CanvasGraphics

// NOTE: This is a completely empty sketch; it can be used as a template.
struct Visualizer {

    // Canvas to draw on
    let canvas: Canvas
    
    // Tortoise to draw with
    let turtle: Tortoise
    
    // MARK: L-system state
    var system: LindenmayerSystem
    
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
    init(for system: LindenmayerSystem,
                  on canvas: Canvas,
                  length: Double,
                  reduction: Double,
                  angle: Degrees,
                  initialPosition: Point,
                  initialHeading: Degrees) {
                
        // Set the canvas we will draw on
        self.canvas = canvas
        
        // Create turtle to draw with
        turtle = Tortoise(drawingUpon: canvas)
        
        // MARK: Initialize L-system state
        self.system = system
        
        // MARK: Initialize L-system rendering instructions
        
        // The length of the line segments used when drawing the system, at generation 0
        self.length = length
        
        // The factor by which to reduce the initial line segment length after each generation / word re-write
        self.reduction = reduction
        
        // The angle by which the turtle will turn left or right; in degrees.
        self.angle = angle
        
        // Where the turtle begins drawing on the canvas
        self.initialPosition = initialPosition
        
        // The initial direction of the turtle
        self.initialHeading = initialHeading
        
        // MARK: Prepare for rendering L-system
        
        // Set the length based on number of generations
        if self.system.generations > 0 {
            for _ in 1...self.system.generations {
                self.length /= self.reduction
            }
        }
    }
    
    mutating func render() {
        
        // Regenerate the L-system so this instance is different (rules are re-applied based on random chance)
        system.generate()
        
        // Move to designated starting position
        canvas.saveState()
        turtle.penUp()
        turtle.setPosition(to: initialPosition)
        turtle.setHeading(to: initialHeading)
        turtle.penDown()
        canvas.restoreState()
        
        // DEBUG:
        print("Now rendering...\n")
        
        // Render the entire system
        for character in system.word {
            
            // Save the state of the canvas (no transformations)
            canvas.saveState()
            
            // Bring canvas into same orientation and origin position as
            // it was when last character in the word was rendered
            turtle.restoreStateOnCanvas()
            
            // Render based on this character
            switch character {
            case "0", "1", "2", "3", "4", "5", "6", "7", "8", "9":
                // Placeholder for changing colour
                break
            case "+":
                // Turn to the left
                turtle.left(by: angle)
            case "-":
                // Turn to the right
                turtle.right(by: angle)
            case "[":
                // Save position and heading
                turtle.saveState()
            case "]":
                // Restore position and heading
                turtle.restoreState()
            default:
                // Any other character means move forward
                turtle.forward(steps: Int(round(length)))
                break
                
            }
            
            // Restore the state of the canvas (no transformations)
            canvas.restoreState()
            
        }
        
    }
    
}
