import Foundation
import CanvasGraphics

// NOTE: This is a completely empty sketch; it can be used as a template.
class LeafSketch: NSObject, Sketchable {
    
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
        var leafSystem = LindenmayerSystem(axiom: "L",
                                               rules: [
                                                "L": [Successor(odds: 1, text: "[++++++F--F--F--F--F--F--F][+++++F--F--F--F--F--F][++++F--F--F--F--F][fFFF][----F++F++F++F++F][-----F++F++F++F++F++F][------F++F++F++F++F++F++F]")],
                                               ],
                                               generations: 1)
        
        // Visualize the system
        var visualizedLeaf = Visualizer(for: leafSystem,
                                            on: canvas,
                                            length: 90,
                                            reduction: 3,
                                            angle: 5,
                                            initialPosition: Point(x: 100, y: 100),
                                            initialHeading: 0)
        
        // Render the system
        visualizedLeaf.render()
        
    }
    
    // This function runs repeatedly, forever, to create the animated effect
    func draw() {
        
        // Nothing is being animated, so nothing needed here
        
    }
    
}
