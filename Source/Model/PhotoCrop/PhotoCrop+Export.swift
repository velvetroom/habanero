import UIKit

extension PhotoCrop
{
    //MARK: private
    
    private func asyncExportImage(completion:@escaping((UIImage) -> ()))
    {
        
    }
    
    //MARK: internal
    
    func exportImage(completion:@escaping((UIImage) -> ()))
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.asyncExportImage(completion:completion)
        }
    }
}
