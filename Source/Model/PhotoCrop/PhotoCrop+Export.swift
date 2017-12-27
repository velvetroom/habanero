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
