import UIKit

extension PhotoCrop
{
    //MARK: private
    
    private func asyncExportImage(
        viewImage:ViewPhotoCropDisplayImage,
        completion:@escaping((UIImage) -> ()))
    {
        guard
        
            let originalImage:CGImage = self.image?.cgImage
        
        else
        {
            return
        }
        
        let points:PhotoCropPoints = PhotoCropPoints.factoryPoints(
            originalImage:originalImage,
            viewImage:viewImage)
        
        guard
        
            let finalImage:CGImage = self.createImage(
                originalImage:originalImage,
                points:points)
        
        else
        {
            return
        }
        
        self.finishedWidth(
            finalImage:finalImage,
            completion:completion)
    }
    
    private func createImage(
        originalImage:CGImage,
        points:PhotoCropPoints) -> CGImage?
    {
        UIGraphicsBeginImageContext(points.contextSize)
        
        guard
        
            let context:CGContext = UIGraphicsGetCurrentContext()
        
        else
        {
            return nil
        }
        
        context.draw(
            originalImage,
            in:points.imageDrawingRect)
        
        let newImage:CGImage? = context.makeImage()
        
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
    private func finishedWidth(
        finalImage:CGImage,
        completion:@escaping((UIImage) -> ()))
    {
        let image:UIImage = UIImage(cgImage:finalImage)
        
        DispatchQueue.main.async
        {   
            completion(image)
        }
    }
    
    //MARK: internal
    
    func exportImage(
        viewImage:ViewPhotoCropDisplayImage,
        completion:@escaping((UIImage) -> ()))
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.asyncExportImage(
                viewImage:viewImage,
                completion:completion)
        }
    }
}
