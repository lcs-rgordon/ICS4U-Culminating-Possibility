//
//  LindemayerSystemSketch.swift
//  Animation
//
//  Created by Russell Gordon on 2021-05-04.
//

import Foundation

// NOTE: This is a completely empty sketch; it can be used as a template.
struct LindenmayerSystem {
    
    // MARK: L-system state
    
    // What the system will draw, without any re-writes based upon production rules
    let axiom: String
    
    // What the system will draw, after re-writes based upon production rules
    var word: String = ""
    
    // How many times to re-write the word, based upon production rules
    let generations: Int
    
    // The rules the define how the word is re-written with each new generation
    let rules: [Predecessor: [Successor]]
    
    // This function runs once
    init(axiom: String,
         rules: [Predecessor: [Successor]],
         generations: Int) {
        
        // MARK: Initialize L-system state
        // What the system will draw, without any re-writes based upon production rules
        self.axiom = axiom
        
        // How many times to re-write the word, based upon production rules
        self.generations = generations
        
        // The rules the define how the word is re-written with each new generation
        self.rules = rules
        
    }
    
    mutating func generate() {
        
        // Generation 0 – we begin with the word the same as the axiom
        self.word = axiom
        
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
                // DEBUG:
                print("After generation \(generation) the word is:")
                print(word)
                
            }
            
        }
        
    }
    
}
