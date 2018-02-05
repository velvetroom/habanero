import Foundation

extension Home
{
    //MARK: internal
    
    func filterItems(completion:@escaping(() -> ()))
    {
        var items:[CookItem] = Array(self.recipesMap.values)
        items = self.filter.show.filter(items:items)
        items = self.filter.order.filter(items:items)
        
        self.items = items
        self.loadCompleted(completion:completion)
    }
}
