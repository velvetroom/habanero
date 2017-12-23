import UIKit

final class ControllerPhotoCrop:Controller<ArchPhotoCrop>
{
    override var prefersStatusBarHidden:Bool
    {
        get
        {
            return true
        }
    }
    
    init(image:UIImage)
    {
        super.init()
        
        self.model.image = image
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: internal
    
    func transitionBack()
    {
        self.parentController?.pop(vertical:ControllerTransition.Vertical.top)
    }
}
