import UIKit

struct PhotoCropMoving
{
    private(set) weak var viewCorner:ViewPhotoCropDisplayCorner!
    var lastPosition:CGPoint
    
    init(
        viewCorner:ViewPhotoCropDisplayCorner,
        location:CGPoint)
    {
        self.viewCorner = viewCorner
        self.lastPosition = location
    }
}
