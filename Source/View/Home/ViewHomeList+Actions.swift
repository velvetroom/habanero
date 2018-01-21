import Foundation

extension ViewHomeList
{
    //MARK: internal
    
    func modelAtIndex(index:IndexPath) -> CookItem
    {
        let item:CookItem = self.controller.model.items[index.item]
        
        return item
    }
}
