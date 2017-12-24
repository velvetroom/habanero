import UIKit

final class ViewPhotoCropDisplayCornerBottomLeft:ViewPhotoCropDisplayCorner
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
        
        let maxY:CGFloat = height - self.lineWidth_2
        
        let initialPoint:CGPoint = CGPoint(
            x:self.lineWidth_2,
            y:0)
        let middlePoint:CGPoint = CGPoint(
            x:self.lineWidth_2,
            y:maxY)
        let endPoint:CGPoint = CGPoint(
            x:width,
            y:maxY)
        
        context.move(to:initialPoint)
        context.addLine(to:middlePoint)
        context.addLine(to:endPoint)
    }
}
