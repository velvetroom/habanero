import UIKit

final class ViewPhotoCropDisplayShade:View<ArchPhotoCrop>
{
    private weak var layerMask:CAShapeLayer!
    
    private var innerRectMinY:CGFloat
    {
        get
        {
            let minY:CGFloat = self.controller.viewMain.viewDisplay.viewCornerTopLeft.layoutTop.constant
            
            return minY
        }
    }
    
    private var innerRectMaxY:CGFloat
    {
        get
        {
            let maxY:CGFloat = self.controller.viewMain.viewDisplay.viewCornerTopRight.layoutTop.constant
            
            return maxY
        }
    }
    
    private var innerRectMinX:CGFloat
    {
        get
        {
            let minX:CGFloat = self.controller.viewMain.viewDisplay.viewCornerTopLeft.layoutLeft.constant
            
            return minX
        }
    }
    
    private var innerRectMaxX:CGFloat
    {
        get
        {
            let maxX:CGFloat = self.controller.viewMain.viewDisplay.viewCornerTopRight.layoutLeft.constant
            
            return maxX
        }
    }
    
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
        self.updateMaskDisplay()
        
        super.layoutSubviews()
    }
    
    //MARK: private
    
    private func updateMaskDisplay()
    {
        let outerRect:CGRect = self.bounds
        let outerWidth:CGFloat = outerRect.width
        let outerHeight:CGFloat = outerRect.height
        
        
        
        let outerPath:UIBezierPath = UIBezierPath(rect:outerRect)
        
        
        let highlightPath:UIBezierPath = UIBezierPath(roundedRect:highlightFrame, cornerRadius:0)
        backgroundPath.append(highlightPath)
        backgroundPath.usesEvenOddFillRule = true
        
        let fillLayer:CAShapeLayer = CAShapeLayer()
        fillLayer.fillRule = kCAFillRuleEvenOdd
        fillLayer.fillColor = UIColor.black.cgColor
        fillLayer.path = backgroundPath.cgPath
        layer.addSublayer(fillLayer)
    }
}
