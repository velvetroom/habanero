import Foundation

extension ViewHomeList
{
    //MARK: internal
    
    func modelAtIndex(index:IndexPath) -> HomeItem
    {
        let item:HomeItem = self.controller.model.items[index.item]
        
        return item
    }
}
