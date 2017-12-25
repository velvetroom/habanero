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
        layerMask.fillColor = UIColor(white:0, alpha:0.8)
        self.layerMask = layerMask
        
        self.layer.addSublayer(layerMask)
    }
    
    override func layoutSubviews()
    {
        super.layoutSubviews()
    }
}
