import Foundation
import CanvasGraphics

// NOTE: This is a completely empty sketch; it can be used as a template.
class LeafyPlantSketch: NSObject, Sketchable {
    
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
        var leafyPlantSystem = LindenmayerSystem(axiom: "XXXHHHH",
                                                 rules: [
                                                    "F": [Successor(odds: 1, text: "FF")],
                                                    "H": [
                                                        Successor(odds: 3, text: "FIH[+++++FI]"),
                                                        Successor(odds: 3, text: "++FIH[+++++FI]"),
                                                        Successor(odds: 3, text: "+FIH[+++++FI]"),
                                                        Successor(odds: 3, text: "--FIH[+++++FI]"),
                                                        Successor(odds: 3, text: "-FIH[+++++FI]"),
                                                        Successor(odds: 3, text: "FIH[+++++FI][-------FI]"),
                                                        Successor(odds: 3, text: "FIH[++++FI][-----FI]"),
                                                        Successor(odds: 3, text: "FIH[------FI]"),
                                                        Successor(odds: 3, text: "FIH[------FI][+++++++FI]"),
                                                        Successor(odds: 3, text: "FIH[--------FI][++++++FI]"),
                                                        Successor(odds: 1, text: "FIF[++++FIF]"),
                                                        Successor(odds: 1, text: "FIF[------FIF]"),
                                                    ],
                                                    "I": [
                                                        Successor(odds: 1, text: "FFF"),
                                                        Successor(odds: 8, text: "[++++++FL]"),
                                                        Successor(odds: 8, text: "[------FL]"),
                                                    ],
                                                    "L": [
                                                        Successor(odds: 1, text: "---[++++++F--F--F--F--F--F--F][fFFF][------F++F++F++F++F++F++F]"),
                                                        Successor(odds: 1, text: "+++[++++++F--F--F--F--F--F--F][fFFF][------F++F++F++F++F++F++F]")
                                                    ],
                                                 ],
                                                 generations: 4)
        
        // Visualize the system
        var visualizedLeafyPlant = Visualizer(for: leafyPlantSystem,
                                              on: canvas,
                                              length: 180,
                                              reduction: 3,
                                              angle: 5,
                                              initialPosition: Point(x: 100, y: 100),
                                              initialHeading: 90)
        
        // Render the system
        visualizedLeafyPlant.render()
        
    }
    
    // This function runs repeatedly, forever, to create the animated effect
    func draw() {
        
        // Nothing is being animated, so nothing needed here
        
    }
    
}
