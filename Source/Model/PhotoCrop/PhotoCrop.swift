import UIKit

final class PhotoCrop:Model<ArchPhotoCrop>
{
    var image:UIImage?
    var scaledWidth:CGFloat
    var scaledHeight:CGFloat
    private(set) var moving:PhotoCropMoving?
    
    required init()
    {
        self.scaledWidth = 0
        self.scaledHeight = 0
        
        super.init()
    }
    
    //MARK: internal
    
    func beganMoving(
        viewCorner:ViewPhotoCropDisplayCorner,
        at location:CGPoint)
    {
        self.moving = PhotoCropMoving(
            viewCorner:viewCorner,
            location:location)
    }
    
    func updateMoving(lastPosition:CGPoint)
    {
        self.moving?.lastPosition = lastPosition
    }
    
    func cleanMoving()
    {
        self.moving = nil
    }
}
