import UIKit

extension PhotoCropPoints
{
    //MARK: private
    
    private static func factoryZoomedSize(
        originalImage:CGImage,
        pointsBuilder:PhotoCropPointsBuilder) -> CGSize
    {
        let imageWidth:CGFloat = CGFloat(originalImage.width)
        let imageHeight:CGFloat = CGFloat(originalImage.height)
        
        let zoom:CGFloat = pointsBuilder.zoomScale
        let zoomedWidth:CGFloat = zoom * imageWidth
        let zoomedHeight:CGFloat = zoom * imageHeight
        
        let size:CGSize = CGSize(
            width:zoomedWidth,
            height:zoomedHeight)
        
        return size
    }
    
    private static func factoryScale(
        originalImage:CGImage,
        pointsBuilder:PhotoCropPointsBuilder) -> CGFloat
    {
        let imageWidth:CGFloat = CGFloat(originalImage.width)
        let scaledImageWidth:CGFloat = pointsBuilder.imageRect.width
        let scale:CGFloat = scaledImageWidth / imageWidth
        
        return scale
    }
    
    private static func factoryContextSize(
        scale:CGFloat,
        pointsBuilder:PhotoCropPointsBuilder) -> CGSize
    {
        let scaledContextSize:CGFloat = pointsBuilder.screenWidth
        let contextSize:CGFloat = scaledContextSize / scale
        
        let size:CGSize = CGSize(
            width:contextSize,
            height:contextSize)
        
        return size
    }
    
    private static func factoryOffset(
        scale:CGFloat,
        pointsBuilder:PhotoCropPointsBuilder) -> CGPoint
    {
        let scaledOffsetX:CGFloat = pointsBuilder.contentOffset.x
        let scaledOffsetY:CGFloat = pointsBuilder.contentOffset.y
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
        pointsBuilder:PhotoCropPointsBuilder) -> CGRect
    {
        let zoomedSize:CGSize = PhotoCropPoints.factoryZoomedSize(
            originalImage:originalImage,
            pointsBuilder:pointsBuilder)
        
        let offset:CGPoint = PhotoCropPoints.factoryOffset(
            scale:scale,
            pointsBuilder:pointsBuilder)
        
        let drawingRect:CGRect = CGRect(
            origin:offset,
            size:zoomedSize)
        
        return drawingRect
    }
    
    //MARK: internal
    
    static func factoryPoints(
        originalImage:CGImage,
        pointsBuilder:PhotoCropPointsBuilder) -> PhotoCropPoints
    {
        let scale:CGFloat = PhotoCropPoints.factoryScale(
            originalImage:originalImage,
            pointsBuilder:pointsBuilder)
        
        let contextSize:CGSize = PhotoCropPoints.factoryContextSize(
            scale:scale,
            pointsBuilder:pointsBuilder)
        
        let imageDrawingRect:CGRect = PhotoCropPoints.factoryImageDrawingRect(
            originalImage:originalImage,
            scale:scale,
            pointsBuilder:pointsBuilder)
        
        let points:PhotoCropPoints = PhotoCropPoints(
            contextSize:contextSize,
            imageDrawingRect:imageDrawingRect)
        
        return points
    }
}
