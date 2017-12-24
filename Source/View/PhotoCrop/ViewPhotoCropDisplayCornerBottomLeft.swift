import UIKit

final class ViewPhotoCropDisplayCornerBottomLeft:ViewPhotoCropDisplayCorner
{
    override func drawWithContext(context:CGContext)
    {
        super.drawWithContext(context:context)
        
        let initialPoint:CGPoint = CGPoint(
            x:self.lineWidth_2,
            y:0)
        let middlePoint:CGPoint = CGPoint(
            x:self.lineWidth_2,
            y:self.sizeMinusLine)
        let endPoint:CGPoint = CGPoint(
            x:ViewPhotoCropDisplayCorner.Constant.size,
            y:self.sizeMinusLine)
        
        context.move(to:initialPoint)
        context.addLine(to:middlePoint)
        context.addLine(to:endPoint)
    }
}
