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
        
    }
    
    func touchesCancelled(touches:Set<UITouch>)
    {
        
    }
    
    func touchesEnded(touches:Set<UITouch>)
    {
        
    }
}
