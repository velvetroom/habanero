import UIKit

final class ViewPhotoCropDisplayShade:View<ArchPhotoCrop>
{
    private weak var layerMask:CAShapeLayer!
    
    override func factoryViews()
    {
        super.factoryViews()
        self.isUserInteractionEnabled = false
        
        let layerMask:CAShapeLayer = CAShapeLayer()
        layerMask.fillRule = kCAFillRuleEvenOdd
        layerMask.fillColor = UIColor(white:0, alpha:0.8).cgColor
        self.layerMask = layerMask
        
        self.layer.addSublayer(layerMask)
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
        
        super.layoutSubviews()
    }
}
