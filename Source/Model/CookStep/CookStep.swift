import Foundation

final class CookStep:Model<ArchCookStep>
{
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
            
//            self.items = Cook.factoryItems(
//                homeItem:homeItem,
//                settings:settings)
        }
    }
}
