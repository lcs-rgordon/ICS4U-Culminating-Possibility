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
        
        // Draw a grey rectangle to give the appearance of a ground, below a white sky
        canvas.drawShapesWithBorders = false
        canvas.fillColor = Color(hue: 0, saturation: 0, brightness: 40, alpha: 100) // Grey
        canvas.drawRectangle(at: Point(x: 0, y: 0), width: canvas.width, height: canvas.height / 3 * 2)
        
        // Create a basic plant like form
        let plant = LindenmayerSystem(axiom: "F",
                                               rules: [
                                                "F": [
                                                    Successor(odds: 1, text: "F[-F][+F]"),
                                                ],
                                               ],
                                               generations: 2)
        
        // Visualize a plant in the background (smaller)
        var backgroundplant = Visualizer(for: plant,
                                        on: canvas,
                                        length: 15,
                                        reduction: 1.25,
                                        angle: 20,
                                        initialPosition: Point(x: 200, y: 150),
                                        initialHeading: 90)
        
        // Actually render the plant
        backgroundplant.render()
        
        // Visualize a plant in the foreground (larger)
        var foregroundplant = Visualizer(for: plant,
                                        on: canvas,
                                        length: 27,
                                        reduction: 1.25,
                                        angle: 20,
                                        initialPosition: Point(x: 400, y: 100),
                                        initialHeading: 90)
        
        // Actually render the plant
        foregroundplant.render()
        
    }
    
    // This function runs repeatedly, forever, to create the animated effect
    func draw() {
        
        // Nothing is being animated, so nothing needed here
        
    }
    
}
