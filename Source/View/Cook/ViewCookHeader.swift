import UIKit

final class ViewCookHeader:View<ArchCook>
{
    override func factoryViews()
    {
        super.factoryViews()
        self.isUserInteractionEnabled = false
    }
}
