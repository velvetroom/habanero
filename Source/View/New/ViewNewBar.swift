import UIKit

final class ViewNewBar:ViewBar<ArchNew>
{
    required init(controller:ControllerNew)
    {
        super.init(controller:controller)
        
        self.labelTitle.text = String.localizedView(key:"ViewNewBar_labelTitle")
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
