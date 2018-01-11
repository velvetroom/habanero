import Foundation

extension ViewCookList
{
    //MARK: internal
    
    func modelAtIndex(index:IndexPath) -> CookItemProtocol
    {
        let item:CookItemProtocol = self.controller.model.items[index.item]
        
        return item
    }
}
