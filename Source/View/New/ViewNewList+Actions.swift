import Foundation

extension ViewNewList
{
    //MARK: internal
    
    func modelAtIndex(index:IndexPath) -> NewItem
    {
        let item:NewItem = self.controller.model.items[index.item]
        
        return item
    }
}
