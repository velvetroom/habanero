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
    
    override func viewDidAppear(_ animated:Bool)
    {
        super.viewDidAppear(animated)
        
        self.viewMain.viewDisplay.adjustImageToDisplay()
        self.viewMain.viewDisplay.adjustCornersToDisplay()
        self.viewMain.viewDisplay.viewShade.updateMask()
    }
    
    //MARK: internal
    
    func transitionBack()
    {
        self.parentController?.pop(vertical:ControllerTransition.Vertical.top)
    }
    
    func imageScaledSize(
        width:CGFloat,
        height:CGFloat)
    {
        self.model.scaledWidth = width
        self.model.scaledHeight = height
    }
}
