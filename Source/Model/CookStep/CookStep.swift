import Foundation

final class CookStep:Model<ArchCookStep>
{
    var items:[CookStepItemProtocol]
    
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
            
            self.items = CookStep.factoryItems(homeItem:homeItem)
        }
    }
    
    required init()
    {
        self.items = []
        
        super.init()
    }
}
