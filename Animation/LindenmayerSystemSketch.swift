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
        
        // Create a system that looks like a tree
        let coniferousTree = LindenmayerSystem(axiom: "F",
                                               rules: [
                                                "F": [
                                                    Successor(odds: 1, text: "3F[++1F[X]][+2F][-4F][--5F[X]]6F"),
                                                    Successor(odds: 1, text: "3F[+1F][+2F][-4F]5F"),
                                                    Successor(odds: 1, text: "3F[+1F][-2F][--6F]4F"),
                                                ],
                                                "X": [
                                                    Successor(odds: 1, text: "X")
                                                ]
                                               ],
                                               generations: 5)
        
        // Draw a grey rectangle to give the appearance of a ground
        canvas.drawShapesWithBorders = false
        canvas.fillColor = Color(hue: 0, saturation: 0, brightness: 40, alpha: 100) // Grey
        canvas.drawRectangle(at: Point(x: 0, y: 0), width: canvas.width, height: canvas.height / 3 * 2)
        
        // Visualize a tree in the background (smaller)
        var backgroundTree = Visualizer(for: coniferousTree,
                                        on: canvas,
                                        length: 15,
                                        reduction: 1.25,
                                        angle: 20,
                                        initialPosition: Point(x: 200, y: 400),
                                        initialHeading: 270)
        
        // Actually render the tree
        backgroundTree.render()
        
        // Visualize a tree in the foreground (larger)
        var foregroundTree = Visualizer(for: coniferousTree,
                                        on: canvas,
                                        length: 27,
                                        reduction: 1.25,
                                        angle: 20,
                                        initialPosition: Point(x: 400, y: 400),
                                        initialHeading: 270)
        
        // Actually render the tree
        foregroundTree.render()
        
    }
    
    // This function runs repeatedly, forever, to create the animated effect
    func draw() {
        
        // Nothing is being animated, so nothing needed here
        
    }
    
}
