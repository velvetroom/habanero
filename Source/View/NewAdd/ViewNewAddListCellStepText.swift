import UIKit

final class ViewNewAddListCellStepText:ViewNewAddListCellStep
{
    private weak var label:UILabel!
    
    override func factoryViews()
    {
        super.factoryViews()
        
        let label:UILabel = UILabel()
        label.isUserInteractionEnabled = false
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.clear
        label.numberOfLines = 0
        label.font = UIFont.regular(size:ViewNewAddListCellStepText.Constants.fontSize)
        label.textColor = UIColor.colourBackgroundDark
        self.label = label
        
        self.addSubview(label)
        
        NSLayoutConstraint.equalsVertical(
            view:label,
            toView:self)
        NSLayoutConstraint.leftToLeft(
            view:label,
            toView:self,
            constant:ViewNewAddList.Constants.marginHorizontal)
        NSLayoutConstraint.rightToLeft(
            view:label,
            toView:self.actionsButton)
    }
    
    override func config(
        controller:ControllerNewAdd,
        model:NewAddSectionItemProtocol)
    {
        super.config(
            controller:controller,
            model:model)
        
        guard
            
            let model:NewAddSectionItemStepText = model as? NewAddSectionItemStepText
            
        else
        {
            return
        }
        
        self.label.text = model.text
    }
}
