import Foundation

struct HomeFilterKeyword
{
    var keyword:String
    
    init()
    {
        self.keyword = String()
    }
    
    //MARK: internal
    
    func filter(items:[CookItem]) -> [CookItem]
    {
        return items
    }
}
