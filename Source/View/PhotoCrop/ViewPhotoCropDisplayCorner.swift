import UIKit

class ViewPhotoCropDisplayCorner:UIView
{
    weak var layoutTop:NSLayoutConstraint!
    weak var layoutLeft:NSLayoutConstraint!
    var previousTouch:CGPoint?
    let lineWidth_2:CGFloat
    let sizeMinusLine:CGFloat
    private(set) var movingRouter:((ControllerPhotoCrop) -> (CGFloat, CGFloat) -> ())?
    private var initialLeft:CGFloat
    private var initialTop:CGFloat
    
    var deltaLeft:CGFloat
    {
        get
        {
            let delta:CGFloat = self.layoutLeft.constant - self.initialLeft
            
            return delta
        }
    }
    
    var deltaTop:CGFloat
    {
        get
        {
            let delta:CGFloat = self.layoutTop.constant - self.initialTop
            
            return delta
        }
    }
    
    init()
    {
        self.lineWidth_2 = ViewPhotoCropDisplayCorner.Constant.lineWidth / 2.0
        self.sizeMinusLine = ViewPhotoCropDisplayCorner.Constant.size - self.lineWidth_2
        self.initialLeft = 0
        self.initialTop = 0
        
        super.init(frame:CGRect.zero)
        self.clipsToBounds = true
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = UIColor.clear
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func draw(_ rect:CGRect)
    {
        guard
            
            let context:CGContext = UIGraphicsGetCurrentContext()
            
        else
        {
            return
        }
        
        context.setLineWidth(ViewPhotoCropDisplayCorner.Constant.lineWidth)
        context.setStrokeColor(UIColor.white.cgColor)
        
        self.drawWithContext(context:context)
        
        context.drawPath(using:CGPathDrawingMode.stroke)
    }
    
    //MARK: internal
    
    final func adjustLayout(
        initialTop:CGFloat,
        initialLeft:CGFloat)
    {
        self.initialTop = initialTop
        self.initialLeft = initialLeft
        self.layoutTop.constant = initialTop
        self.layoutLeft.constant = initialLeft
    }
    
    func drawWithContext(context:CGContext) { }
}
