import UIKit

extension ControllerPhotoCrop
{
    private var viewCornerTopLeft:ViewPhotoCropDisplayCornerTopLeft
    {
        get
        {
            let viewCorner:ViewPhotoCropDisplayCornerTopLeft = self.viewMain.viewDisplay.viewCornerTopLeft
            
            return viewCorner
        }
    }
    
    private var viewCornerTopRight:ViewPhotoCropDisplayCornerTopRight
    {
        get
        {
            let viewCorner:ViewPhotoCropDisplayCornerTopRight = self.viewMain.viewDisplay.viewCornerTopRight
            
            return viewCorner
        }
    }
    
    private var viewCornerBottomLeft:ViewPhotoCropDisplayCornerBottomLeft
    {
        get
        {
            let viewCorner:ViewPhotoCropDisplayCornerBottomLeft = self.viewMain.viewDisplay.viewCornerBottomLeft
            
            return viewCorner
        }
    }
    
    private var viewCornerBottomRight:ViewPhotoCropDisplayCornerBottomRight
    {
        get
        {
            let viewCorner:ViewPhotoCropDisplayCornerBottomRight = self.viewMain.viewDisplay.viewCornerBottomRight
            
            return viewCorner
        }
    }
    
    //MARK: private
    
    private func constrainPosition(
        value:CGFloat,
        minValue:CGFloat,
        maxValue:CGFloat) -> CGFloat
    {
        let newValue:CGFloat
        
        if value >= minValue
        {
            if value <= maxValue
            {
                newValue = value
            }
            else
            {
                newValue = maxValue
            }
        }
        else
        {
            newValue = minValue
        }
        
        return newValue
    }
    
    //MARK: internal
    
    func cornerTopLeftMoveTo(
        positionX:CGFloat,
        positionY:CGFloat)
    {
        let minX:CGFloat = self.viewCornerTopLeft.initialLeft
        let maxX:CGFloat = self.viewCornerTopRight.layoutLeft.constant -
            ControllerPhotoCrop.Constants.minCornerSeparation
        
        let minY:CGFloat = self.viewCornerTopLeft.initialTop
        let maxY:CGFloat = self.viewCornerBottomLeft.layoutTop.constant -
            ControllerPhotoCrop.Constants.minCornerSeparation
        
        let constrainedX:CGFloat = constrainPosition(
            value:positionX,
            minValue:minX,
            maxValue:maxX)
        let constrainedY:CGFloat = constrainPosition(
            value:positionY,
            minValue:minY,
            maxValue:maxY)
        
        self.viewCornerTopLeft.layoutLeft.constant = constrainedX
        self.viewCornerTopLeft.layoutTop.constant = constrainedY
        self.viewCornerBottomLeft.layoutLeft.constant = constrainedX
        self.viewCornerTopRight.layoutTop.constant = constrainedY
    }
    
    func cornerTopRightMoveTo(
        positionX:CGFloat,
        positionY:CGFloat)
    {
        let minX:CGFloat = self.viewCornerTopLeft.layoutLeft.constant +
            ControllerPhotoCrop.Constants.minCornerSeparation
        
        let maxX:CGFloat = self.viewCornerTopRight.initialLeft
        let minY:CGFloat = self.viewCornerTopRight.initialTop
        let maxY:CGFloat = self.viewCornerBottomRight.layoutTop.constant -
            ControllerPhotoCrop.Constants.minCornerSeparation
        
        let constrainedX:CGFloat = constrainPosition(
            value:positionX,
            minValue:minX,
            maxValue:maxX)
        
        let constrainedY:CGFloat = constrainPosition(
            value:positionY,
            minValue:minY,
            maxValue:maxY)
        
        self.viewCornerTopRight.layoutLeft.constant = constrainedX
        self.viewCornerTopRight.layoutTop.constant = constrainedY
        self.viewCornerBottomRight.layoutLeft.constant = constrainedX
        self.viewCornerTopLeft.layoutTop.constant = constrainedY
    }
    
    func cornerBottomLeftMoveTo(
        positionX:CGFloat,
        positionY:CGFloat)
    {
        
    }
    
    func cornerBottomRightMoveTo(
        positionX:CGFloat,
        positionY:CGFloat)
    {
        
    }
}
