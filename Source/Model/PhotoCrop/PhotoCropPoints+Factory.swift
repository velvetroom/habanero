import UIKit

extension PhotoCropPoints
{
    //MARK: private
    
    private static func factoryZoomedSize(
        originalImage:CGImage,
        mask:PhotoCropMask) -> CGSize
    {
        let imageWidth:CGFloat = CGFloat(originalImage.width)
        let imageHeight:CGFloat = CGFloat(originalImage.height)
        
        let zoom:CGFloat = mask.zoomScale
        let zoomedWidth:CGFloat = zoom * imageWidth
        let zoomedHeight:CGFloat = zoom * imageHeight
        
        let size:CGSize = CGSize(
            width:zoomedWidth,
            height:zoomedHeight)
        
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
    
    private static func factoryContextSize(
        scale:CGFloat,
        mask:PhotoCropMask) -> CGSize
    {
        let scaledContextSize:CGFloat = mask.screenWidth
        let contextSize:CGFloat = scaledContextSize / scale
        
        let size:CGSize = CGSize(
            width:contextSize,
            height:contextSize)
        
        return size
    }
    
    private static func factoryOffset(
        scale:CGFloat,
        mask:PhotoCropMask) -> CGPoint
    {
        let scaledOffsetX:CGFloat = mask.contentOffset.x
        let scaledOffsetY:CGFloat = mask.contentOffset.y
        let offsetX:CGFloat = scaledOffsetX / scale
        let offsetY:CGFloat = scaledOffsetY / scale
        
        let offset:CGPoint = CGPoint(
            x:offsetX,
            y:offsetY)
        
        return offset
    }
    
    private static func factoryImageDrawingRect(
        originalImage:CGImage,
        scale:CGFloat,
        mask:PhotoCropMask) -> CGRect
    {
        let zoomedSize:CGSize = PhotoCropPoints.factoryZoomedSize(
            originalImage:originalImage,
            mask:mask)
        
        let offset:CGPoint = PhotoCropPoints.factoryOffset(
            scale:scale,
            mask:mask)
        
        let drawingRect:CGRect = CGRect(
            origin:offset,
            size:zoomedSize)
        
        return drawingRect
    }
    
    //MARK: internal
    
    static func factoryPoints(
        originalImage:CGImage,
        mask:PhotoCropMask) -> PhotoCropPoints
    {
        let scale:CGFloat = PhotoCropPoints.factoryScale(
            originalImage:originalImage,
            mask:mask)
        
        let contextSize:CGSize = PhotoCropPoints.factoryContextSize(
            scale:scale,
            mask:mask)
        
        let imageDrawingRect:CGRect = PhotoCropPoints.factoryImageDrawingRect(
            originalImage:originalImage,
            scale:scale,
            mask:mask)
        
        let points:PhotoCropPoints = PhotoCropPoints(
            contextSize:contextSize,
            imageDrawingRect:imageDrawingRect)
        
        return points
    }
}
