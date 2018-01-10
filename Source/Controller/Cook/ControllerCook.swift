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
