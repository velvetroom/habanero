import UIKit

final class ViewNewAddBar:ViewBarBack<ArchNewAdd>
{
    override func factoryViews()
    {
        super.factoryViews()
        
        self.labelTitle.text = String.localizedView(key:"ViewNewAddBar_labelTitle")
    }
    
    override func selectorButtonBack(sender button:UIButton)
    {
        self.controller.transitionBack()
    }
}
