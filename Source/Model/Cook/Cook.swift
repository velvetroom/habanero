import Foundation

final class Cook:Model<ArchCook>
{
    var items:[CookItemProtocol]
    
    var homeItem:HomeItem?
    {
        didSet
        {
            guard
                
                let recipe:Recipe = self.homeItem?.recipe
            
            else
            {
                return
            }
            
            self.items = Cook.factoryItems(recipe:recipe)
        }
    }
    
    required init()
    {
        self.items = []
        
        super.init()
    }
}
