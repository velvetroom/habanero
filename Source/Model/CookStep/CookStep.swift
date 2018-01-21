import Foundation

final class CookStep:Model<ArchCookStep>
{
    var items:[CookStepItemProtocol]
    let storage:Storage
    
    var cookItem:CookItem?
    {
        didSet
        {
            guard
                
                let cookItem:CookItem = self.cookItem
                
            else
            {
                return
            }
            
            self.items = CookStep.factoryItems(cookItem:cookItem)
        }
    }
    
    required init()
    {
        self.items = []
        self.storage = Storage()
        
        super.init()
    }
}
