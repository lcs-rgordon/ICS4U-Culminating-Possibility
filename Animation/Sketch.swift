import Foundation
import CanvasGraphics

class Sketch: NSObject {
    
    // NOTE: This class must contain an object named 'currentDrawing'.
    //       The object must be an instance of a type that conforms to
    //       the Sketchable protocol.
    //
    //       Therefore, the line immediately below, or one like it, must always be present.
    //var currentDrawing =  LeafSketch()

    // To try out other included sketches:
    // 1. Comment out the code on line 11.
    // 2. Uncomment one of the lines below.
//    var currentDrawing = TurtleSketch()
//    var currentDrawing = AudioInputSketch()
//    var currentDrawing = StaticSketch()
//    var currentDrawing = LindenmayerSystemSketch()
//    var currentDrawing = PerlinNoiseSketch()
//    var currentDrawing = TriangleSketch()
//    var currentDrawing = TemporarySceneSketch()
//    var currentDrawing = LeafSketch()
    var currentDrawing = LeafyPlantSketch()
//    var currentDrawing = AnotherLeafyPlantSketch()
//    var currentDrawing = CattailSketch()
//    var currentDrawing = LeafSketch()

}
