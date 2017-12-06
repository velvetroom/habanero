import UIKit

final class ViewNewList:ViewCollection<ArchNew,  ViewNewListCell, ViewCollectionFlow>
{
    required init(controller:ControllerNew)
    {
        super.init(controller:controller)
        
        self.config()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
