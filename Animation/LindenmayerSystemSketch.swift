//
//  LindemayerSystemSketch.swift
//  Animation
//
//  Created by Russell Gordon on 2021-05-04.
//

import Foundation
import CanvasGraphics

// NOTE: This is a completely empty sketch; it can be used as a template.
class LindenmayerSystemSketch: NSObject, Sketchable {
    
    // NOTE: Every sketch must contain an object of type Canvas named 'canvas'
    //       Therefore, the line immediately below must always be present.
    var canvas: Canvas
    
    // This function runs once
    override init() {
        
        // Create canvas object – specify size
        canvas = Canvas(width: 500, height: 500)
        
        // Draw slowly
        canvas.framesPerSecond = 15
        
        // Enable faster rendering
        canvas.highPerformance = true
                
        // Create a basic branching form
        let stochasticExample = LindenmayerSystem(axiom: "AAAAF",
                                                  rules: [
                                                    "F": [
                                                        Successor(odds: 1, text: "F[-F][+F]"),
                                                        Successor(odds: 1, text: "F[--F][+F]"),
                                                        Successor(odds: 1, text: "F[-F][++F]"),
                                                    ],
                                                    "X": [
                                                        Successor(odds: 1, text: "XX"),
                                                    ],
                                                  ],
                                                  generations: 3)

        for i in 0...3 {

            // Visualize the form
            var form = Visualizer(for: stochasticExample,
                                  on: canvas,
                                  length: 30,
                                  reduction: 1.25,
                                  angle: 30,
                                  initialPosition: Point(x: 100 + i * 100, y: 250),
                                  initialHeading: 90)

            // Actually render the plant
            form.render()

        }
        
    }
    
    // This function runs repeatedly, forever, to create the animated effect
    func draw() {
        
        // Nothing is being animated, so nothing needed here
        
    }
    
}
