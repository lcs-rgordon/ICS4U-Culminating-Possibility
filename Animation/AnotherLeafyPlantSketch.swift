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
                                                Successor(odds: 1, text: """
                                                                            1FFFFG
                                                                            2FFFFFFFFL
                                                                            """),
                                            ],
                                            "G" : [
                                                Successor(odds: 1, text: """
                                                                            3[FF]
                                                                            4[+++++++++++++FHFFL]
                                                                            5[-------------FHFFL]
                                                                            """),
                                            ],
                                            "H" : [
                                                Successor(odds: 1, text: """
                                                                            4[+++++++++XFL]
                                                                            5[---------XFL]
                                                                            """),
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
                                                                            [++++++F--F--F--F--F--F--F]
                                                                            [+++++F--F--F--F--F--F]
                                                                            [++++F--F--F--F--F]
                                                                            [fFFF]
                                                                            [----F++F++F++F++F]
                                                                            [-----F++F++F++F++F++F]
                                                                            [------F++F++F++F++F++F++F]
                                                                            """),
                                            ],
                                           ],
                                           generations: 4)
        
        // Define the visualization
        var visualizedLeafyPlant = Visualizer(for: leafyPlant,
                                              on: canvas,
                                              length: 405,
                                              reduction: 3,
                                              angle: 5,
                                              initialPosition: Point(x: 100, y: 100),
                                              initialHeading: 90,
                                              colors: [
                                                "0" : LSColor.black,
                                                "1" : LSColor.green,
                                                "2" : LSColor.orange,
                                                "3" : LSColor.purple,
                                                "4" : LSColor.red,
                                                "5" : LSColor.yellow,
                                              ])
        
        // Render the system
        visualizedLeafyPlant.render()
        
        leafyPlant.generate()
        
    }
    
    // This function runs repeatedly, forever, to create the animated effect
    func draw() {
        
        
    }
    
}
