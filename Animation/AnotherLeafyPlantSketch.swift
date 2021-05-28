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
                                                                            1FFFFFFFFFFFFFFFFG
                                                                            2FFFFFFFFL
                                                                            """),
                                                Successor(odds: 1, text: """
                                                                            1FFFFFFFFFFFFFG
                                                                            2FFFFFFFFL
                                                                            """),
                                                Successor(odds: 1, text: """
                                                                            1FFFFFFFFFFFFFFFG
                                                                            2FFFFFFFFL
                                                                            """),
                                            ],
                                            "G" : [
                                                Successor(odds: 1, text: """
                                                                            3[FF]
                                                                            4[+++++++++++++FHFFL]
                                                                            5[FF-------------FHFFL]
                                                                            """),
                                                Successor(odds: 1, text: """
                                                                            3[FF]
                                                                            4[FF+++++++++++++FHFFL]
                                                                            5[-------------FHFFL]
                                                                            """),
                                            ],
                                            "H" : [
                                                Successor(odds: 1, text: """
                                                                            4[+++++++++FL]
                                                                            5[---------FL]
                                                                            """),
                                                Successor(odds: 1, text: """
                                                                            4[+++++++XFL]
                                                                            5[---------XFL]
                                                                            """),
                                                Successor(odds: 1, text: """
                                                                            4[+++++++++XFL]
                                                                            5[-------XFL]
                                                                            """),
                                            ],
                                            "Y" : [
                                                Successor(odds: 1, text: "YY"),
                                                Successor(odds: 1, text: "Z"),
                                            ],
                                            "Z" : [
                                                Successor(odds: 1, text: "WW"),
                                            ],
                                            "L": [
                                                Successor(odds: 1, text: """
                                                                            [++++++Y--Y--Y--Y--Y--Y--Y]
                                                                            [+++++Y--Y--Y--Y--Y--Y]
                                                                            [++++Y--Y--Y--Y--Y]
                                                                            [fYYY]
                                                                            [----Y++Y++Y++Y++Y]
                                                                            [-----Y++Y++Y++Y++Y++Y]
                                                                            [------Y++Y++Y++Y++Y++Y++Y]
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
        
        // Make a few other versions of this plant
        var secondPlant = visualizedLeafyPlant
        var thirdPlant = visualizedLeafyPlant
        
        // Slide position of those plants over
        secondPlant.initialPosition = Point(x: 250, y: 100)
        thirdPlant.initialPosition = Point(x: 400, y: 100)

        // Render the system
        visualizedLeafyPlant.render()
        secondPlant.render()
        thirdPlant.render()
        
    }
    
    // This function runs repeatedly, forever, to create the animated effect
    func draw() {
        
        
    }
    
}
