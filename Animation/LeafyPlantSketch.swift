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
        
        // Visualize the system
        var visualizedLeafyPlant = Visualizer(fromJSONFile: "gordon-leafy-plant", drawingOn: canvas)
        
        // Render several versions of this system
        for x in stride(from: 50, through: 450, by: 100) {
            
            // Randomize the start position a bit
            visualizedLeafyPlant.initialPosition = Point(x: x + Int.random(in: -10...10), y: 100 + Int.random(in: -20...20))
            
            // Render the system
            visualizedLeafyPlant.render()

        }
                
        
    }
    
    // This function runs repeatedly, forever, to create the animated effect
    func draw() {
        
        // Nothing is being animated, so nothing needed here
        
    }
    
}
