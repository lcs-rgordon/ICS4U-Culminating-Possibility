import Foundation
import CanvasGraphics

// NOTE: This is a completely empty sketch; it can be used as a template.
class TriangleSketch: NSObject, Sketchable {
    
    // NOTE: Every sketch must contain an object of type Canvas named 'canvas'
    //       Therefore, the line immediately below must always be present.
    var canvas: Canvas
    
    // This function runs once
    override init() {
        
        // Create canvas object – specify size
        canvas = Canvas(width: 500, height: 500)
        
        // Enable faster rendering
        canvas.highPerformance = true
        
        // Create the basic L-system
        var triangleSystem = LindenmayerSystem(axiom: "GH++++++++++++++++++++++++GH++++++++++++++++++++++++GH++++++++++++++++++++++++",
                                               rules: [
                                                "G": [Successor(odds: 1, text: "I[------------------H]I")],
                                                "I": [Successor(odds: 1, text: "FFFFFFFF")],
                                                "H": [Successor(odds: 1, text: "FFFF++++++++++++++++++++++++FFFF++++++++++++++++++++++++FFFF++++++++++++++++++++++++")],
                                               ],
                                               generations: 3)
        
        // Visualize the system
        var visualizedTriangle = Visualizer(for: triangleSystem,
                                            on: canvas,
                                            length: 320,
                                            reduction: 4,
                                            angle: 5,
                                            initialPosition: Point(x: 100, y: 100),
                                            initialHeading: 0)
        
        // Render the system
        visualizedTriangle.render()
        
    }
    
    // This function runs repeatedly, forever, to create the animated effect
    func draw() {
        
        // Nothing is being animated, so nothing needed here
        
    }
    
}
