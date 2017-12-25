import UIKit

extension ControllerPhotoCrop
{
    //MARK: internal
    
    func touchesBegan(touches:Set<UITouch>)
    {
        guard
            
            let touch:UITouch = touches.first,
            let viewCorner:ViewPhotoCropDisplayCorner = touch.view as? ViewPhotoCropDisplayCorner
            
        else
        {
            return
        }
        
        let location:CGPoint = touch.location(in:self.viewMain.viewDisplay)
        
        self.model.beganMoving(
            viewCorner:viewCorner,
            at:location)
    }
    
    func touchesMoved(touches:Set<UITouch>)
    {
        guard
        
            let touch:UITouch = touches.first,
            let moving:PhotoCropMoving = self.model.moving
        
        else
        {
            return
        }
        
        let location:CGPoint = touch.location(in:self.viewMain.viewDisplay)
        let deltaX:CGFloat = location.x - moving.lastPosition.x
        let deltaY:CGFloat = location.y - moving.lastPosition.y
        let newX:CGFloat = moving.viewCorner.layoutLeft.constant + deltaX
        let newY:CGFloat = moving.viewCorner.layoutTop.constant + deltaY
        
        self.model.updateMoving(lastPosition:location)
    }
    
    func touchesCancelled(touches:Set<UITouch>)
    {
        
    }
    
    func touchesEnded(touches:Set<UITouch>)
    {
        
    }
}
