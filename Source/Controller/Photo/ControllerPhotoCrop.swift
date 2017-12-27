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
    
    private var pointsBuilder:PhotoCropPointsBuilder
    {
        get
        {
            let viewImage:ViewPhotoCropDisplayImage = self.viewMain.viewDisplay.viewImage
            var builder:PhotoCropPointsBuilder = PhotoCropPointsBuilder()
            builder.imageRect = viewImage.imageView.frame
            builder.screenWidth = viewImage.bounds.width
            builder.contentOffset = viewImage.viewScroll.contentOffset
            builder.zoomScale = viewImage.viewScroll.zoomScale
            
            return builder
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
        self.model.exportImage(pointsBuilder:self.pointsBuilder)
        { [weak self] (exportedImage:UIImage) in
            
            self?.transitionBack(exportedImage:exportedImage)
        }
    }
    
    func transitionBack(exportedImage:UIImage?)
    {
        self.parentController?.pop(vertical:ControllerTransition.Vertical.top)
        { [weak self] in
            
            self?.model.completion?(exportedImage)
        }
    }
    
    func rotateImageRight()
    {
        self.model.rotateImageRight
        { [weak self] in
            
            self?.viewMain.viewDisplay.viewImage.adjustImage()
        }
    }
}
