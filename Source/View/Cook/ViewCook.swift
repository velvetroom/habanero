import UIKit

final class ViewCook:ViewMain<ArchCook>
{
    override func factoryViews()
    {
        super.factoryViews()
        
        self.shouldPanBack = true
    }
}
