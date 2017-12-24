import UIKit

final class ViewPhotoCropDisplayCornerTopLeft:ViewPhotoCropDisplayCorner
{
    override func drawWithContext(context:CGContext)
    {
        super.drawWithContext(context:context)
        
        let initialPoint:CGPoint = CGPoint(
            x:self.lineWidth_2,
            y:ViewPhotoCropDisplayCorner.Constant.size)
        let middlePoint:CGPoint = CGPoint(
            x:self.lineWidth_2,
            y:self.lineWidth_2)
        let endPoint:CGPoint = CGPoint(
            x:ViewPhotoCropDisplayCorner.Constant.size,
            y:self.lineWidth_2)
        
        context.move(to:initialPoint)
        context.addLine(to:middlePoint)
        context.addLine(to:endPoint)
    }
}
