import UIKit

final class ViewPhotoCropDisplay:View<ArchPhotoCrop>
{
    private(set) weak var viewImage:ViewPhotoCropDisplayImage!
    private(set) weak var viewCornerTopLeft:ViewPhotoCropDisplayCornerTopLeft!
    private(set) weak var viewCornerTopRight:ViewPhotoCropDisplayCornerTopRight!
    private(set) weak var viewCornerBottomLeft:ViewPhotoCropDisplayCornerBottomLeft!
    private(set) weak var viewCornerBottomRight:ViewPhotoCropDisplayCornerBottomRight!
    
    override func factoryViews()
    {
        super.factoryViews()
        
        let viewImage:ViewPhotoCropDisplayImage = ViewPhotoCropDisplayImage(controller:self.controller)
        self.viewImage = viewImage
        
        let viewCornerTopLeft:ViewPhotoCropDisplayCornerTopLeft = ViewPhotoCropDisplayCornerTopLeft()
        self.viewCornerTopLeft = viewCornerTopLeft
        
        let viewCornerTopRight:ViewPhotoCropDisplayCornerTopRight = ViewPhotoCropDisplayCornerTopRight()
        self.viewCornerTopRight = viewCornerTopRight
        
        let viewCornerBottomLeft:ViewPhotoCropDisplayCornerBottomLeft = ViewPhotoCropDisplayCornerBottomLeft()
        self.viewCornerBottomLeft = viewCornerBottomLeft
        
        let viewCornerBottomRight:ViewPhotoCropDisplayCornerBottomRight = ViewPhotoCropDisplayCornerBottomRight()
        self.viewCornerBottomRight = viewCornerBottomRight
        
        self.addSubview(viewImage)
        self.addSubview(viewCornerTopLeft)
        self.addSubview(viewCornerTopRight)
        self.addSubview(viewCornerBottomLeft)
        self.addSubview(viewCornerBottomRight)
        
        self.layoutCorner(viewCorner:viewCornerTopLeft)
        self.layoutCorner(viewCorner:viewCornerTopRight)
        self.layoutCorner(viewCorner:viewCornerBottomLeft)
        self.layoutCorner(viewCorner:viewCornerBottomRight)
        
        viewImage.layoutTop = NSLayoutConstraint.topToTop(
            view:viewImage,
            toView:self)
        viewImage.layoutLeft = NSLayoutConstraint.leftToLeft(
            view:viewImage,
            toView:self)
        viewImage.layoutRight = NSLayoutConstraint.rightToRight(
            view:viewImage,
            toView:self)
        viewImage.layoutBottom = NSLayoutConstraint.bottomToBottom(
            view:viewImage,
            toView:self)
    }
    
    //MARK: private
    
    private func layoutCorner(viewCorner:ViewPhotoCropDisplayCorner)
    {
        self.addSubview(viewCorner)
        
        viewCorner.layoutTop = NSLayoutConstraint.topToTop(
            view:viewCorner,
            toView:self)
        viewCorner.layoutLeft = NSLayoutConstraint.leftToLeft(
            view:viewCorner,
            toView:self)
        NSLayoutConstraint.size(
            view:viewCorner,
            constant:ViewPhotoCropDisplayCorner.Constant.cornerSize)
    }
}
