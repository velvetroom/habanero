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
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.viewMain.viewDisplay.alpha = 0
    }
    
    override func viewDidAppear(_ animated:Bool)
    {
        super.viewDidAppear(animated)
        
        self.viewMain.viewDisplay.adjustImageToDisplay()
        self.viewMain.viewDisplay.adjustCornersToDisplay()
        self.viewMain.viewDisplay.viewShade.updateMask()
        
        self.animateShowDisplay()
    }
    
    //MARK: private
    
    private func animateShowDisplay()
    {
        UIView.animate(withDuration:ViewGlobal.Constants.animationDuration)
        { [weak self] in
            
            self?.viewMain.viewDisplay.alpha = 1
        }
    }
    
    override func touchesBegan(
        _ touches:Set<UITouch>,
        with event:UIEvent?)
    {
        
    }
    
    override func touchesMoved(
        _ touches:Set<UITouch>,
        with event:UIEvent?)
    {
        
    }
    
    override func touchesCancelled(
        _ touches:Set<UITouch>,
        with event:UIEvent?)
    {
        
    }
    
    override func touchesEnded(
        _ touches:Set<UITouch>,
        with event:UIEvent?)
    {
        
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
