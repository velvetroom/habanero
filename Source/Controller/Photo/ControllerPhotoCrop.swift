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
    
    override func viewWillAppear(_ animated:Bool)
    {
        super.viewWillAppear(animated)
        
        self.viewMain.viewDisplay.adjustImageToDisplay()
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
