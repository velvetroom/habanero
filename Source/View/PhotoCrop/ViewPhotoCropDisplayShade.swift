import UIKit

final class ViewPhotoCropDisplayShade:View<ArchPhotoCrop>
{
    private weak var layerMask:CAShapeLayer!
    private weak var layoutUpperBorderTop:NSLayoutConstraint!
    private weak var layoutLowerBorderTop:NSLayoutConstraint!
    
    override func factoryViews()
    {
        super.factoryViews()
        self.isUserInteractionEnabled = false
        
        let upperBorder:ViewBorder = ViewBorder(colour:UIColor.white)
        let lowerBorder:ViewBorder = ViewBorder(colour:UIColor.white)
        
        let layerMask:CAShapeLayer = CAShapeLayer()
        layerMask.fillRule = kCAFillRuleEvenOdd
        layerMask.fillColor = UIColor(white:0, alpha:0.8).cgColor
        self.layerMask = layerMask
        
        self.layer.addSublayer(layerMask)
        
        self.addSubview(upperBorder)
        self.addSubview(lowerBorder)
        
        layoutUpperBorderTop = NSLayoutConstraint.topToTop(
            view:upperBorder,
            toView:self)
        NSLayoutConstraint.height(
            view:upperBorder,
            constant:ViewGlobal.Constants.borderWidth)
        NSLayoutConstraint.equalsHorizontal(
            view:upperBorder,
            toView:self)
        
        layoutLowerBorderTop = NSLayoutConstraint.topToTop(
            view:lowerBorder,
            toView:upperBorder)
        NSLayoutConstraint.height(
            view:lowerBorder,
            constant:ViewGlobal.Constants.borderWidth)
        NSLayoutConstraint.equalsHorizontal(
            view:lowerBorder,
            toView:self)
    }
    
    override func layoutSubviews()
    {
        let width:CGFloat = self.bounds.width
        let height:CGFloat = self.bounds.height
        let delta:CGFloat = height - width
        let marginTop:CGFloat = delta / 2.0
        let innerRect:CGRect = CGRect(
            x:0,
            y:marginTop,
            width:width,
            height:width)
        
        let innerPath:UIBezierPath = UIBezierPath(rect:innerRect)
        let outerPath:UIBezierPath = UIBezierPath(rect:self.bounds)
        outerPath.usesEvenOddFillRule = true
        outerPath.append(innerPath)
        
        self.layerMask.path = outerPath.cgPath
        
        layoutUpperBorderTop.constant = marginTop
        layoutLowerBorderTop.constant = width
        
        super.layoutSubviews()
    }
}
