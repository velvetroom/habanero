import Foundation

extension ViewCookList
{
    //MARK: internal
    
    func modelAtIndex(index:IndexPath) -> CookListItemProtocol
    {
        let item:CookListItemProtocol = self.controller.model.items[index.item]
        
        return item
    }
}
