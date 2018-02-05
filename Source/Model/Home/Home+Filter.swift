import Foundation

extension Home
{
    //MARK: internal
    
    func filterItems(completion:@escaping(() -> ()))
    {
        var items:[CookItem] = self.recipesMap.values
        items = self.filter.show.filter(items:items)
        
        self.loadCompleted(completion:completion)
    }
}
