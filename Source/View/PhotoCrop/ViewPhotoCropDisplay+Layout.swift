import UIKit

extension ViewPhotoCropDisplay
{
    //MARK: internal
    
    func adjustImageToDisplay()
    {
        guard
            
            let image:UIImage = self.controller.model.image
            
        else
        {
            return
        }
        
        let padding2:CGFloat = ViewPhotoCropDisplay.Constants.padding
        let displayWidth:CGFloat = self.bounds.width
        let displayHeight:CGFloat = self.bounds.height
        let usableWidth:CGFloat = displayWidth - padding2
        let usableHeight:CGFloat = displayHeight - padding2
        let imageWidth:CGFloat = image.size.width
        let imageHeight:CGFloat = image.size.height
        let deltaWidth:CGFloat = imageWidth / usableWidth
        let deltaHeight:CGFloat = imageHeight / usableHeight
        let maxDelta:CGFloat = max(deltaWidth, deltaHeight)
        let scaledWidth:CGFloat = imageWidth / maxDelta
        let scaledHeight:CGFloat = imageHeight / maxDelta
        let remainWidth:CGFloat = displayWidth - scaledWidth
        let remainHeight:CGFloat = displayHeight - scaledHeight
        let marginWidth:CGFloat = remainWidth / 2.0
        let marginHeight:CGFloat = remainHeight / 2.0
        
        self.controller.imageScaledSize(
            width:scaledWidth,
            height:scaledHeight)
        
        self.viewImage.layoutRight.constant = -marginWidth
        self.viewImage.layoutLeft.constant = marginWidth
        self.viewImage.layoutTop.constant = marginHeight
        self.viewImage.layoutBottom.constant = -marginHeight
    }
    
    func adjustCornersToDisplay()
    {
        let displayWidth:CGFloat = self.bounds.width
        let displayHeight:CGFloat = self.bounds.height
        let minX:CGFloat = self.viewImage.layoutLeft.constant
        let minY:CGFloat = self.viewImage.layoutTop.constant
        let maxX:CGFloat = displayWidth + self.viewImage.layoutRight.constant -
            ViewPhotoCropDisplayCorner.Constant.size
        let maxY:CGFloat = displayHeight + self.viewImage.layoutBottom.constant -
            ViewPhotoCropDisplayCorner.Constant.size
        let minMaximum:CGFloat = min(maxX, maxY)
        
        self.viewCornerBottomLeft.adjustLayout(
            initialTop:minMaximum,
            initialLeft:minX)
        self.viewCornerBottomRight.adjustLayout(
            initialTop:minMaximum,
            initialLeft:minMaximum)
        self.viewCornerTopLeft.adjustLayout(
            initialTop:minY,
            initialLeft:minX)
        self.viewCornerTopRight.adjustLayout(
            initialTop:minY,
            initialLeft:minMaximum)
    }
}
