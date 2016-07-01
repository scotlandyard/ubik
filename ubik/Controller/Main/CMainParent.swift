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
    var pipelineState: MTLRenderPipelineState! = nil
    var commandQueue: MTLCommandQueue! = nil
    var timer: CADisplayLink! = nil
    
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
        
        // 1
        let defaultLibrary:MTLLibrary = device.newDefaultLibrary()!
        let fragmentProgram:MTLFunction = defaultLibrary.newFunctionWithName("basic_fragment")!
        let vertexProgram:MTLFunction = defaultLibrary.newFunctionWithName("basic_vertex")!
        
        // 2
        let pipelineStateDescriptor = MTLRenderPipelineDescriptor()
        pipelineStateDescriptor.vertexFunction = vertexProgram
        pipelineStateDescriptor.fragmentFunction = fragmentProgram
        pipelineStateDescriptor.colorAttachments[0].pixelFormat = MTLPixelFormat.BGRA8Unorm
        
        // 3
        device.newRenderPipelineStateWithDescriptor(pipelineStateDescriptor, options: MTLPipelineOption.None)
        { (pipelineState, piplineReflection, error) in
            
            self.pipelineState = pipelineState
            
            
            print("error: \(error)")
            
            
            self.timer = CADisplayLink(target: self, selector:#selector(self.gameloop))
            self.timer.addToRunLoop(NSRunLoop.mainRunLoop(), forMode: NSDefaultRunLoopMode)
        }
        
        
        commandQueue = device.newCommandQueue()
        
        
    }
    
    func render() {
        
        let drawable = metalLayer.nextDrawable()!
        
        let renderPassDescriptor = MTLRenderPassDescriptor()
        renderPassDescriptor.colorAttachments[0].texture = drawable.texture
        renderPassDescriptor.colorAttachments[0].loadAction = .Clear
        renderPassDescriptor.colorAttachments[0].clearColor = MTLClearColor(red: 0.0, green: 104.0/255.0, blue: 5.0/255.0, alpha: 1.0)
        
        let commandBuffer = commandQueue.commandBuffer()
        
        let renderEncoderOpt = commandBuffer.renderCommandEncoderWithDescriptor(renderPassDescriptor)
        
        renderEncoderOpt.setRenderPipelineState(pipelineState)
        renderEncoderOpt.setVertexBuffer(vertexBuffer, offset: 0, atIndex: 0)
        renderEncoderOpt.drawPrimitives(.Triangle, vertexStart: 0, vertexCount: 3, instanceCount: 1)
        renderEncoderOpt.endEncoding()
        
        commandBuffer.presentDrawable(drawable)
        commandBuffer.commit()
    }
    
    func gameloop() {
        autoreleasepool {
            self.render()
        }
    }
}