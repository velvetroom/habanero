import UIKit

struct PhotoCropSquare
{
    var minX:CGFloat
    var minY:CGFloat
    var maxX:CGFloat
    var maxY:CGFloat
    private(set) var positionLeft:CGFloat
    private(set) var positionTop:CGFloat
    
    init()
    {
        self.positionTop = 0
        self.positionLeft = 0
        self.minX = 0
        self.minY = 0
        self.maxX = 0
        self.maxY = 0
    }
    
    //MARK: private
    
    private func constrainX(positionX:CGFloat) -> CGFloat
    {
        let constrained:CGFloat
        
        if positionX > self.maxX
        {
            constrained = self.maxX
        }
        else if positionX < self.minX
        {
            constrained = self.minX
        }
        else
        {
            constrained = positionX
        }
        
        return constrained
    }
    
    private func constrainY(positionY:CGFloat) -> CGFloat
    {
        let constrained:CGFloat
        
        if positionY > self.maxY
        {
            constrained = self.maxY
        }
        else if positionY < self.minY
        {
            constrained = self.minY
        }
        else
        {
            constrained = positionY
        }
        
        return constrained
    }
    
    //MARK: internal
    
    func factorySquarePositions(
        positionX:CGFloat,
        positionY:CGFloat)
    {
        let constrainedX:CGFloat = self.constrainX(positionX:positionX)
        let constrainedY:CGFloat = self.constrainY(positionY:positionY)
    }
}
