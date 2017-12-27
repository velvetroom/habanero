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
    
    init(
        image:UIImage,
        completion:@escaping((UIImage?) -> ()))
    {
        super.init()
        
        self.model.image = image
        self.model.completion = completion
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
        
        self.animateShowDisplay()
    }
    
    //MARK: private
    
    private func animateShowDisplay()
    {
        self.viewMain.viewDisplay.viewImage.adjustImage()
        
        UIView.animate(withDuration:ViewGlobal.Constants.animationDuration)
        { [weak self] in
            
            self?.viewMain.viewDisplay.alpha = 1
        }
    }
    
    //MARK: internal
    
    func exportImage()
    {
        
    }
    
    func transitionBack()
    {
        self.parentController?.pop(vertical:ControllerTransition.Vertical.top)
    }
    
    func rotateImageRight()
    {
        self.model.rotateImageRight
        { [weak self] in
            
            self?.viewMain.viewDisplay.viewImage.adjustImage()
        }
    }
}
