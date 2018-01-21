import Foundation

final class Cook:Model<ArchCook>
{
    var items:[CookListItemProtocol]
    weak var settings:Settings?
    
    var homeItem:HomeItem?
    {
        didSet
        {
            guard
                
                let homeItem:HomeItem = self.homeItem,
                let settings:Settings = self.settings
            
            else
            {
                return
            }
            
            self.items = Cook.factoryItems(
                homeItem:homeItem,
                settings:settings)
        }
    }
    
    required init()
    {
        self.items = []
        
        super.init()
    }
}
