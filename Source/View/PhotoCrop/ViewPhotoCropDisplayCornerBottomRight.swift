import UIKit

final class ViewPhotoCropDisplayCornerBottomRight:ViewPhotoCropDisplayCorner
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
        
        let maxX:CGFloat = width - self.lineWidth_2
        let maxY:CGFloat = height - self.lineWidth_2
        
        let initialPoint:CGPoint = CGPoint(
            x:maxX,
            y:0)
        let middlePoint:CGPoint = CGPoint(
            x:maxX,
            y:maxY)
        let endPoint:CGPoint = CGPoint(
            x:0,
            y:maxY)
        
        context.move(to:initialPoint)
        context.addLine(to:middlePoint)
        context.addLine(to:endPoint)
    }
}
