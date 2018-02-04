import Foundation

extension Home
{
    //MARK: internal
    
    func filterItems(completion:@escaping(() -> ()))
    {
        var items:[CookItem] = self.items
        items = self.filter.show.filter(items:items)
        
    }
}
