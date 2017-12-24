import UIKit

final class ViewPhotoCropDisplayCornerBottomRight:ViewPhotoCropDisplayCorner
{
    override func drawWithContext(context:CGContext)
    {
        super.drawWithContext(context:context)
        
        let initialPoint:CGPoint = CGPoint(
            x:self.sizeMinusLine,
            y:0)
        let middlePoint:CGPoint = CGPoint(
            x:self.sizeMinusLine,
            y:self.sizeMinusLine)
        let endPoint:CGPoint = CGPoint(
            x:0,
            y:self.sizeMinusLine)
        
        context.move(to:initialPoint)
        context.addLine(to:middlePoint)
        context.addLine(to:endPoint)
    }
}
