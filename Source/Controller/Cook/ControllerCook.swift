import UIKit

final class ControllerCook:Controller<ArchCook>
{
    init(item:HomeItem)
    {
        super.init()
        
        self.model.item = item
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
