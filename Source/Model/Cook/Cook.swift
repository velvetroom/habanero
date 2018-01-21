import Foundation

final class Cook:Model<ArchCook>
{
    var items:[CookListItemProtocol]
    weak var settings:Settings?
    
    var cookItem:CookItem?
    {
        didSet
        {
            guard
                
                let cookItem:CookItem = self.cookItem,
                let settings:Settings = self.settings
            
            else
            {
                return
            }
            
            self.items = Cook.factoryItems(
                cookItem:cookItem,
                settings:settings)
        }
    }
    
    required init()
    {
        self.items = []
        
        super.init()
    }
}
