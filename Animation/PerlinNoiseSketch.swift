import Foundation
import CanvasGraphics

// NOTE: This is a completely empty sketch; it can be used as a template.
class PerlinNoiseSketch: NSObject, Sketchable {
    
    // NOTE: Every sketch must contain an object of type Canvas named 'canvas'
    //       Therefore, the line immediately below must always be present.
    var canvas: Canvas
    
    // Create a Perlin noise generator
    var perlinNoise = PerlinGenerator()
    var step = 0.01

    
    // This function runs once
    override init() {
        
        // Create canvas object – specify size
        canvas = Canvas(width: 500, height: 500)
        
        // Enable faster rendering
        canvas.highPerformance = true

    }
    
    // This function runs repeatedly, forever, to create the animated effect
    func draw() {
        
        // Draw a line based on a random number (pure random noise)
        // The height is controlled by the random factor
        let randomValue = Int.random(in: 1...500)
        
        // Draw a line based on a random number (Perlin noise)
        let randomPerlinValue = perlinNoise.perlinNoise(x: Double(canvas.frameCount) * step)
        let height = map(value: randomPerlinValue,
                         fromLower: 0,
                         fromUpper: 1.0,
                         toLower: 0,
                         toUpper: 500)
        
        // Draw vertical line using this random height
        canvas.drawLine(from: Point(x: canvas.frameCount, y: 0),
                        to: Point(x: canvas.frameCount, y: Int(height)))
        
    }
    
}
