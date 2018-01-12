import Foundation

final class Cook:Model<ArchCook>
{
    var items:[CookItemProtocol]
    
    var homeItem:HomeItem?
    {
        didSet
        {
            guard
                
                let homeItem:HomeItem = self.homeItem
            
            else
            {
                return
            }
            
            self.items = Cook.factoryItems(homeItem:homeItem)
        }
    }
    
    required init()
    {
        self.items = []
        
        super.init()
    }
}
