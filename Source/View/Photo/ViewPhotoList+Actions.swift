import Foundation

extension ViewPhotoList
{
    //MARK: internal
    
    func modelAtIndex(index:IndexPath) -> PhotoOptionProtocol
    {
        let item:PhotoOptionProtocol = self.controller.model.options[index.item]
        
        return item
    }
}
