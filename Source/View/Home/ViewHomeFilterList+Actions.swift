import Foundation

extension ViewHomeFilterList
{
    //MARK: internal
    
    func modelAtIndex(index:IndexPath) -> HomeFilterOptionsProtocol
    {
        let item:HomeFilterOptionsProtocol = self.controller.model.filterOptions[index.item]
        
        return item
    }
}
