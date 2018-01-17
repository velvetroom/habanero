import Foundation

extension ViewCookStepList
{
    //MARK: internal
    
    func modelAtIndex(index:IndexPath) -> CookStepItemProtocol
    {
        let item:CookStepItemProtocol = self.controller.model.items[index.item]
        
        return item
    }
}
