import UIKit

final class ViewNewAddBar:ViewBarBack<ArchNewAdd>
{
    required init(controller:ControllerNewAdd)
    {
        super.init(controller:controller)
        
        self.labelTitle.text = String.localizedView(key:"ViewNewAddBar_labelTitle")
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func selectorButtonBack(sender button:UIButton)
    {
        self.controller.transitionBack()
    }
}
