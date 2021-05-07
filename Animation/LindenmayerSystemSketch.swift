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
        
        // Enable faster rendering
        canvas.highPerformance = true
        
        // Create a grey rectangle that creates apperance of a ground and horizon
        canvas.drawShapesWithBorders = false
        canvas.fillColor = Color(hue: 0, saturation: 0, brightness: 45, alpha: 100)
        canvas.drawRectangle(at: Point(x: 0, y: 0), width: canvas.width, height: canvas.height / 3 * 2)
        canvas.fillColor = .black
        
        // Create four visualizations of a basic branching tree
        for i in 0...3 {
            
            // Visualize the form
            var form = Visualizer(fromJSONFile: "gordon-basic-branching-tree",
                                  drawingOn: self.canvas)
            
            // Adjust the starting position of this tree a bit
            form.initialPosition = Point(x: 100 + i * 100, y: 275 + Int.random(in: -15...15))

            // Actually render the tree
            form.render()
                        
        }
        
        // Load Scott's berry tree from it's JSON representation
        var largeBerryTree = Visualizer(fromJSONFile: "scott-berry-tree",
                                        drawingOn: self.canvas)

        // Render Scott's berry tree
        largeBerryTree.render()
        
        // Make a smaller berry tree in the background
        // Since Visualizer is a struct, this is a copy, not a reference
        var smallBerryTree = largeBerryTree
        smallBerryTree.initialPosition = Point(x: 100, y: 125)
        smallBerryTree.length = 12
        smallBerryTree.reduction = 1.15
        
        // Render Scott's small berry tree
        smallBerryTree.render()

    }
    
    // This function runs repeatedly, forever, to create the animated effect
    func draw() {
        
        // Nothing is being animated, so nothing needed here
        
    }
    
}
