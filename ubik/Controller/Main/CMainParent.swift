import UIKit
import Metal

class CMainParent:UIViewController
{
    let dManager:DManager = DManager()
    
    var device:MTLDevice!
    var metalLayer:CAMetalLayer!
    let vertexData:[Float] = [
        0.0, 1.0, 0.0,
        -1.0, -1.0, 0.0,
        1.0, -1.0, 0.0]
    var vertexBuffer:MTLBuffer! = nil
    
    override func viewDidLoad()
    {
        let level:DModelLevel = dManager.fetchLevel()
        level.steps += 1
        dManager.saveContext()
        
        
        
        device = MTLCreateSystemDefaultDevice()
        metalLayer = CAMetalLayer()
        metalLayer.device = device
        metalLayer.pixelFormat = MTLPixelFormat.BGRA8Unorm
        metalLayer.framebufferOnly = true
        metalLayer.frame = view.layer.frame
        
        view.layer.addSublayer(metalLayer)
        
        let dataSize:Int = vertexData.count * sizeofValue(vertexData[0])
        vertexBuffer = device.newBufferWithBytes(vertexData, length:dataSize, options: MTLResourceOptions.OptionCPUCacheModeDefault)
    }
}