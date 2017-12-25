import UIKit

final class ViewPhotoCropDisplayShade:View<ArchPhotoCrop>
{
    private weak var layerMask:CAShapeLayer!
    
    private var innerRect:CGRect
    {
        get
        {
            let minX:CGFloat = self.innerRectMinX
            let maxX:CGFloat = self.innerRectMaxX
            let minY:CGFloat = self.innerRectMinY
            let maxY:CGFloat = self.innerRectMaxY
            
            let width:CGFloat = maxX - minX
            let height:CGFloat = maxY - minY
            
            let rect:CGRect = CGRect(
                x:minX,
                y:minY,
                width:width,
                height:height)
            
            return rect
        }
    }
    
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
            let maxY:CGFloat = self.controller.viewMain.viewDisplay.viewCornerBottomRight.layoutTop.constant +
                ViewPhotoCropDisplayCorner.Constant.size
            
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
            let maxX:CGFloat = self.controller.viewMain.viewDisplay.viewCornerTopRight.layoutLeft.constant +
                ViewPhotoCropDisplayCorner.Constant.size
            
            return maxX
        }
    }
    
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
    
    //MARK: internal
    
    func updateMask()
    {
        let innerPath:UIBezierPath = UIBezierPath(rect:self.innerRect)
        let outerPath:UIBezierPath = UIBezierPath(rect:self.bounds)
        outerPath.usesEvenOddFillRule = true
        outerPath.append(innerPath)
        
        self.layerMask.path = outerPath.cgPath
    }
}
