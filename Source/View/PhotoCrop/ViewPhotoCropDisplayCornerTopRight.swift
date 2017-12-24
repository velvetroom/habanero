import UIKit

final class ViewPhotoCropDisplayCornerTopRight:ViewPhotoCropDisplayCorner
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
        
        let initialPoint:CGPoint = CGPoint(
            x:maxX,
            y:height)
        let middlePoint:CGPoint = CGPoint(
            x:maxX,
            y:self.lineWidth_2)
        let endPoint:CGPoint = CGPoint(
            x:0,
            y:self.lineWidth_2)
        
        context.move(to:initialPoint)
        context.addLine(to:middlePoint)
        context.addLine(to:endPoint)
    }
}
