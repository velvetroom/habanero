import UIKit

final class ViewSliderBar:UIView
{
    init()
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        translatesAutoresizingMaskIntoConstraints = false
        isUserInteractionEnabled = false
        
        let border:ViewBorder = ViewBorder(colour:UIColor(white:0, alpha:0.2))
        
        let blur:ViewBlur = ViewBlur.light()
        blur.alpha = 1
        
        let colorStart:UIColor = UIColor(white:1, alpha:0.1)
        let colorEnd:UIColor = UIColor.white
        
        let viewGradient:ViewGradient = ViewGradient.horizontal(
            colourLeft:colorStart,
            colourRight:colorEnd)
        
        addSubview(viewGradient)
        addSubview(blur)
        addSubview(border)
        
        NSLayoutConstraint.equals(
            view:viewGradient,
            toView:self)
        
        NSLayoutConstraint.equals(
            view:blur,
            toView:self)
        
        NSLayoutConstraint.equalsVertical(
            view:border,
            toView:self)
        NSLayoutConstraint.width(
            view:border,
            constant:ViewGlobal.Constants.borderWidth)
        NSLayoutConstraint.rightToRight(
            view:border,
            toView:self)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
