import Foundation
import CanvasGraphics

class TemporarySceneSketch: NSObject, Sketchable {
    
    // NOTE: Every sketch must contain an object of type Canvas named 'canvas'
    //       Therefore, the line immediately below must always be present.
    var canvas: Canvas
    
    // This function runs once
    override init() {
        
        // Create canvas object – specify size
        canvas = Canvas(width: 500, height: 500)
        
        // Turn on high performance
        canvas.highPerformance = true
        
        // Load Ilana's fern plant
        var fern = Visualizer(fromJSONFile: "ilana-fern-plant",
                              drawingOn: canvas)
        
        // Adjust initial position
        fern.initialPosition = Point(x: 100, y: 150)
        
        // Adjust fern's size
        fern.length = 3
        
        // Copy this fern
        var newFern = fern
        
        // Make the copy more to the right
        newFern.initialPosition = Point(x: 350, y: 75)
        
        // Make it a bit bigger
        newFern.length = 5
        
        // Render both ferns
        fern.render()
        newFern.render()
        
    }
    
    // This function runs repeatedly, forever, to create the animated effect
    func draw() {
        
        
    }
    
}
