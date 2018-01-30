import UIKit

final class ViewOptionsBar:ViewBar<ArchOptions>
{
    override func factoryViews()
    {
        super.factoryViews()
        self.labelTitle.text = String.localizedView(key:"ViewOptionsBar_labelTitle")
    }
}
