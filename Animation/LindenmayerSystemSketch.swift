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
        
        // Create a grey rectangle that creates apperance of a horizon
        canvas.drawShapesWithBorders = false
        canvas.fillColor = Color(hue: 0, saturation: 0, brightness: 45, alpha: 100)
        canvas.drawRectangle(at: Point(x: 0, y: 0), width: canvas.width, height: canvas.height / 3 * 2)
        canvas.fillColor = .black
        
        // Create a basic branching form
        let stochasticExample = LindenmayerSystem(axiom: "AAAAF",
                                                  rules: [
                                                    "F": [
                                                        Successor(odds: 1, text: "F[-F][+F]"),
                                                        Successor(odds: 1, text: "F[--F][+F]"),
                                                        Successor(odds: 8, text: "F[-F][++F]"),
                                                    ],
                                                  ],
                                                  generations: 3)
        
        // Create four visualizations of this example
        for i in 0...3 {
            
            // Visualize the form
            var form = Visualizer(for: stochasticExample,
                                  on: canvas,
                                  length: 30,
                                  reduction: 1.25,
                                  angle: 30,
                                  initialPosition: Point(x: 100 + i * 100, y: 275),
                                  initialHeading: 90)
            
            // Actually render the plant
            form.render()
            
        }
        
        // Visualize Scott's berry tree
        let berryTree = LindenmayerSystem(axiom: "[EEF][++EEF][--EEF]",
                                          rules: [
                                            "F": [
                                                Successor(odds: 1, text: "G[--G][+GK]"),
                                                Successor(odds: 3, text: "G[--G][+G]"),
                                                Successor(odds: 3, text: "G[-G][++G]"),
                                            ],
                                            "G": [
                                                Successor(odds: 3, text: "X[-H][+H]"),
                                                Successor(odds: 1, text: "XX[--HK][+H]"),
                                                Successor(odds: 3, text: "XH[-H][++H]"),
                                            ],
                                            "H": [
                                                Successor(odds: 1, text: "XXI[-I][+IK]"),
                                                Successor(odds: 3, text: "XXI[--I][+I]"),
                                                Successor(odds: 3, text: "XXI[-IK][++I]"),
                                            ],
                                            "I": [
                                                Successor(odds: 3, text: "XE[-J][+E]"),
                                                Successor(odds: 3, text: "XJ[--E][+J]"),
                                                Successor(odds: 3, text: "XJ[-E][++J]"),
                                            ],
                                            "J": [
                                                Successor(odds: 3, text: "XXX[-XX][+X]"),
                                                Successor(odds: 3, text: "XXXX[--XXK][+XX]"),
                                                Successor(odds: 3, text: "XXXX[-XK][++X]"),
                                            ],
                                            "K": [
                                                Successor(odds: 3, text: "B[EB++++++++EB++++++EB++++++EB+++++++++EB]")
                                            ],
                                          ],
                                          generations: 6)
        
        // Visualize Scott's berry tree
        var smallBerryTree = Visualizer(for: berryTree,
                                        on: canvas,
                                        length: 15,
                                        reduction: 1.1,
                                        angle: 15,
                                        initialPosition: Point(x: 325, y: 25),
                                        initialHeading: 90)
        
        // Render Scott's berry tree
        smallBerryTree.render()
        
        
    }
    
    // This function runs repeatedly, forever, to create the animated effect
    func draw() {
        
        // Nothing is being animated, so nothing needed here
        
    }
    
}
