import UIKit

final class ViewHomeBar:ViewBar<ArchHome>
{
    override func factoryViews()
    {
        super.factoryViews()
        self.labelTitle.text = String.localizedView(key:"ViewHomeBar_labelTitle")
    }
}
