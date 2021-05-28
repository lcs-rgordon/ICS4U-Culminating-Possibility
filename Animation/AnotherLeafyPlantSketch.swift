import Foundation
import CanvasGraphics

class AnotherLeafyPlantSketch: NSObject, Sketchable {
    
    // NOTE: Every sketch must contain an object of type Canvas named 'canvas'
    //       Therefore, the line immediately below must always be present.
    var canvas: Canvas
    
    // This function runs once
    override init() {
        
        // Create canvas object – specify size
        canvas = Canvas(width: 500, height: 500)
        
        // Turn on high performance
        canvas.highPerformance = true
        
        // Define the basic system
        var leafyPlant = LindenmayerSystem(axiom: "S",
                                           rules: [
                                            "S" : [
                                                Successor(odds: 1, text: "0T1G2L"),
                                            ],
                                            "T" : [
                                                Successor(odds: 1, text: """
                                                                            F++++++
                                                                            F++++++
                                                                            F++++++
                                                                            F++++++
                                                                            F++++++
                                                                            F++++++
                                                                            F++++++
                                                                            F++++++
                                                                            F++++++
                                                                            F++++++
                                                                            F++++++
                                                                            F++++++
                                                                            """)
                                            ],
                                            "L": [
                                                Successor(odds: 1, text: """
                                                                            0[++++++F--F--F--F--F--F--F]
                                                                            1[+++++F--F--F--F--F--F]
                                                                            2[++++F--F--F--F--F]
                                                                            3[fFFF]
                                                                            2[----F++F++F++F++F]
                                                                            1[-----F++F++F++F++F++F]
                                                                            0[------F++F++F++F++F++F++F]
                                                                            """),
                                            ],
                                           ],
                                           generations: 2)
        
        // Define the visualization
        var visualizedLeafyPlant = Visualizer(for: leafyPlant,
                                              on: canvas,
                                              length: 30,
                                              reduction: 1,
                                              angle: 5,
                                              initialPosition: Point(x: 100, y: 100),
                                              initialHeading: 90,
                                              colors: [
                                                "0" : LSColor.black,
                                                "1" : LSColor.green,
                                                "2" : LSColor.orange,
                                              ])
        
        // Render the system
        visualizedLeafyPlant.render()
        
        leafyPlant.generate()
        
    }
    
    // This function runs repeatedly, forever, to create the animated effect
    func draw() {
        
        
    }
    
}
