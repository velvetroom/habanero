import Foundation

extension ViewOptionsList
{
    //MARK: internal
    
    func modelAtIndex(index:IndexPath) -> OptionsItemProtocol
    {
        let item:OptionsItemProtocol = self.controller.model.items[index.item]
        
        return item
    }
}
