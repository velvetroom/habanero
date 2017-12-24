import UIKit

final class ViewPhotoCropDisplayCornerTopLeft:ViewPhotoCropDisplayCorner
{
    override func drawWithContext(
        context:CGContext,
        width:CGFloat,
        height:CGFloat)
    {
        super.drawWithContext(
            context:context,
            width:width,
            height:height)
        
        let initialPoint:CGPoint = CGPoint(
            x:self.lineWidth_2,
            y:height)
        let middlePoint:CGPoint = CGPoint(
            x:self.lineWidth_2,
            y:self.lineWidth_2)
        let endPoint:CGPoint = CGPoint(
            x:width,
            y:self.lineWidth_2)
        
        context.move(to:initialPoint)
        context.addLine(to:middlePoint)
        context.addLine(to:endPoint)
    }
}
