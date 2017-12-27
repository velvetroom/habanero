import UIKit

extension PhotoCropPoints
{
    //MARK: private
    
    private static func factoryDrawingSize(
        originalImage:CGImage,
        mask:PhotoCropMask) -> CGSize
    {
        let imageWidth:CGFloat = CGFloat(originalImage.width)
        let imageHeight:CGFloat = CGFloat(originalImage.height)
        let ceilWidth:CGFloat = ceil(imageWidth)
        let ceilHeight:CGFloat = ceil(imageHeight)
        
        let size:CGSize = CGSize(
            width:ceilWidth,
            height:ceilHeight)
        
        return size
    }
    
    private static func factoryScale(
        originalImage:CGImage,
        mask:PhotoCropMask) -> CGFloat
    {
        let imageWidth:CGFloat = CGFloat(originalImage.width)
        let scaledImageWidth:CGFloat = mask.imageRect.width
        let scale:CGFloat = scaledImageWidth / imageWidth
        
        return scale
    }
    
    private static func factoryContextSize(mask:PhotoCropMask) -> CGSize
    {
        let scaledContextSize:CGFloat = mask.screenWidth
        let contextSize:CGFloat = scaledContextSize / mask.imageScale
        let ceilSize:CGFloat = ceil(contextSize)
        
        let size:CGSize = CGSize(
            width:ceilSize,
            height:ceilSize)
        
        return size
    }
    
    private static func factoryOffset(mask:PhotoCropMask) -> CGPoint
    {
        let scaledOffsetX:CGFloat = -mask.contentOffset.x
        let scaledOffsetY:CGFloat = mask.contentOffset.y
        let offsetX:CGFloat = scaledOffsetX / mask.imageScale
        let offsetY:CGFloat = scaledOffsetY / mask.imageScale
        let roundX:CGFloat = round(offsetX)
        let roundY:CGFloat = round(offsetY)
        
        let offset:CGPoint = CGPoint(
            x:roundX,
            y:roundY)
        
        return offset
    }
    
    private static func factoryImageDrawingRect(
        originalImage:CGImage,
        mask:PhotoCropMask) -> CGRect
    {
        let size:CGSize = PhotoCropPoints.factoryDrawingSize(
            originalImage:originalImage,
            mask:mask)
        
        let offset:CGPoint = PhotoCropPoints.factoryOffset(mask:mask)
        
        let drawingRect:CGRect = CGRect(
            origin:offset,
            size:size)
        
        return drawingRect
    }
    
    //MARK: internal
    
    static func factoryPoints(
        originalImage:CGImage,
        mask:PhotoCropMask) -> PhotoCropPoints
    {
        var mask:PhotoCropMask = mask
        mask.imageScale = PhotoCropPoints.factoryScale(
            originalImage:originalImage,
            mask:mask)
        
        let contextSize:CGSize = PhotoCropPoints.factoryContextSize(mask:mask)
        
        let imageDrawingRect:CGRect = PhotoCropPoints.factoryImageDrawingRect(
            originalImage:originalImage,
            mask:mask)
        
        let points:PhotoCropPoints = PhotoCropPoints(
            contextSize:contextSize,
            imageDrawingRect:imageDrawingRect)
        
        return points
    }
}
