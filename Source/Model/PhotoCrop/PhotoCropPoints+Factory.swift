import UIKit

extension PhotoCropPoints
{
    //MARK: private
    
    private static func factoryZoomedSize(
        originalImage:CGImage,
        viewImage:ViewPhotoCropDisplayImage) -> CGSize
    {
        let imageWidth:CGFloat = CGFloat(originalImage.width)
        let imageHeight:CGFloat = CGFloat(originalImage.height)
        
        let zoom:CGFloat = viewImage.viewScroll.zoomScale
        let zoomedWidth:CGFloat = zoom * imageWidth
        let zoomedHeight:CGFloat = zoom * imageHeight
        
        let size:CGSize = CGSize(
            width:zoomedWidth,
            height:zoomedHeight)
        
        return size
    }
    
    private static func factoryScale(
        originalImage:CGImage,
        viewImage:ViewPhotoCropDisplayImage) -> CGFloat
    {
        let imageWidth:CGFloat = CGFloat(originalImage.width)
        let scaledImageWidth:CGFloat = viewImage.imageView.frame.size.width
        let scale:CGFloat = scaledImageWidth / imageWidth
        
        return scale
    }
    
    private static func factoryContextSize(
        scale:CGFloat,
        viewImage:ViewPhotoCropDisplayImage) -> CGSize
    {
        let scaledContextSize:CGFloat = viewImage.bounds.size.width
        let contextSize:CGFloat = scaledContextSize / scale
        
        let size:CGSize = CGSize(
            width:contextSize,
            height:contextSize)
        
        return size
    }
    
    private static func factoryOffset(
        scale:CGFloat,
        viewImage:ViewPhotoCropDisplayImage) -> CGPoint
    {
        let scaledOffsetX:CGFloat = viewImage.viewScroll.contentOffset.x
        let scaledOffsetY:CGFloat = viewImage.viewScroll.contentOffset.x
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
        viewImage:ViewPhotoCropDisplayImage) -> CGRect
    {
        let zoomedSize:CGSize = PhotoCropPoints.factoryZoomedSize(
            originalImage:originalImage,
            viewImage:viewImage)
        
        let offset:CGPoint = PhotoCropPoints.factoryOffset(
            scale:scale,
            viewImage:viewImage)
        
        let drawingRect:CGRect = CGRect(
            origin:offset,
            size:zoomedSize)
        
        return drawingRect
    }
    
    //MARK: internal
    
    static func factoryPoints(
        originalImage:CGImage,
        viewImage:ViewPhotoCropDisplayImage) -> PhotoCropPoints
    {
        let scale:CGFloat = PhotoCropPoints.factoryScale(
            originalImage:originalImage,
            viewImage:viewImage)
        
        let contextSize:CGSize = PhotoCropPoints.factoryContextSize(
            scale:scale,
            viewImage:viewImage)
        
        let imageDrawingRect:CGRect = PhotoCropPoints.factoryImageDrawingRect(
            originalImage:originalImage,
            scale:scale,
            viewImage:viewImage)
        
        let points:PhotoCropPoints = PhotoCropPoints(
            contextSize:contextSize,
            imageDrawingRect:imageDrawingRect)
        
        return points
    }
}
