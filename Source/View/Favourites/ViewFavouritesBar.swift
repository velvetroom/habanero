import UIKit

final class ViewFavouritesBar:ViewBar<ArchFavourites>
{
    override func factoryViews()
    {
        super.factoryViews()
        self.labelTitle.text = String.localizedView(key:"ViewFavouritesBar_labelTitle")
    }
}
