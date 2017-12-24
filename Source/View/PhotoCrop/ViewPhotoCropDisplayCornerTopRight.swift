import UIKit

final class ViewPhotoCropDisplayCornerTopRight:ViewPhotoCropDisplayCorner
{
    override func drawWithContext(context:CGContext)
    {
        super.drawWithContext(context:context)
        
        let initialPoint:CGPoint = CGPoint(
            x:self.sizeMinusLine,
            y:ViewPhotoCropDisplayCorner.Constant.size)
        let middlePoint:CGPoint = CGPoint(
            x:self.sizeMinusLine,
            y:self.lineWidth_2)
        let endPoint:CGPoint = CGPoint(
            x:0,
            y:self.lineWidth_2)
        
        context.move(to:initialPoint)
        context.addLine(to:middlePoint)
        context.addLine(to:endPoint)
    }
}
