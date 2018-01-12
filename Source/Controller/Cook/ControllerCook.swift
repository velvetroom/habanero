import UIKit

final class ControllerCook:Controller<ArchCook>
{
    override var preferredStatusBarStyle:UIStatusBarStyle
    {
        get
        {
            return UIStatusBarStyle.lightContent
        }
    }
    
    init(
        item:HomeItem,
        settings:Settings)
    {
        super.init()
     
        self.model.homeItem = item
        self.model.settings = settings
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
