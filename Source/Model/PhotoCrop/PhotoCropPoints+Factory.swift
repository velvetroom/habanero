import UIKit

extension PhotoCropPoints
{
    //MARK: private
    
    private static func factoryDrawingSize(
        originalImage:CGImage,
        mask:PhotoCropMask) -> CGSize
    {
        let imageWidth:CGFloat = CGFloat(originalImage.width) / mask.imageScale
        let imageHeight:CGFloat = CGFloat(originalImage.height) / mask.imageScale
        let ceilWidth:CGFloat = ceil(imageWidth)
        let ceilHeight:CGFloat = ceil(imageHeight)
        
        let size:CGSize = CGSize(
            width:ceilWidth,
            height:ceilHeight)
        
        return size
    }
    
    private static func factoryRenderScale(
        originalImage:CGImage,
        mask:PhotoCropMask) -> CGFloat
    {
        let imageWidth:CGFloat = CGFloat(originalImage.width)
        let scaledImageWidth:CGFloat = mask.imageRect.width
        let scale:CGFloat = scaledImageWidth / imageWidth
        
        return scale
    }
    
    private static func factoryImageScale(mask:PhotoCropMask) -> CGFloat
    {
        let scale:CGFloat
        let imageSize:CGFloat = mask.screenWidth / mask.renderScale
        
        if imageSize > PhotoCrop.Constants.maxImageSize
        {
            let delta:CGFloat = imageSize / PhotoCrop.Constants.maxImageSize
            scale = delta
        }
        else
        {
            scale = 1
        }
        
        return scale
    }
    
    private static func factoryContextSize(mask:PhotoCropMask) -> CGSize
    {
        let scaledContextSize:CGFloat = mask.screenWidth / mask.imageScale
        let contextSize:CGFloat = scaledContextSize / mask.renderScale
        let ceilSize:CGFloat = ceil(contextSize)
        
        let size:CGSize = CGSize(
            width:ceilSize,
            height:ceilSize)
        
        return size
    }
    
    private static func factoryOffset(mask:PhotoCropMask) -> CGPoint
    {
        let scaledOffsetX:CGFloat = -mask.contentOffset.x / mask.imageScale
        let scaledOffsetY:CGFloat = mask.contentOffset.y / mask.imageScale
        let offsetX:CGFloat = scaledOffsetX / mask.renderScale
        let offsetY:CGFloat = scaledOffsetY / mask.renderScale
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
        
        mask.renderScale = PhotoCropPoints.factoryRenderScale(
            originalImage:originalImage,
            mask:mask)
        
        mask.imageScale = PhotoCropPoints.factoryImageScale(mask:mask)
        
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
