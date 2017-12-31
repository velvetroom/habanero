import UIKit

final class ViewNewAddListCellInfoSubtitle:ViewNewAddListCellText
{
    override func factoryViews()
    {
        super.factoryViews()
        
        self.labelTitle.text = String.localizedView(key:"ViewNewAddListCellInfoTitle_labelSubtitle")
    }
    
    override func config(
        controller:ControllerNewAdd,
        model:NewAddSectionItemProtocol)
    {
        super.config(
            controller:controller,
            model:model)
        
        guard
            
            let model:NewAddSectionItemInfoSubtitle = model as? NewAddSectionItemInfoSubtitle
            
        else
        {
            return
        }
        
        self.labelContent.text = model.subtitle
    }
    
    override func selectorEdit()
    {
        self.controller?.editInfoSubtitle()
    }
}
