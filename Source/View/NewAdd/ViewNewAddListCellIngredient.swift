import UIKit

final class ViewNewAddListCellIngredient:ViewNewAddListCell
{
    private weak var label:UILabel!
    
    override func factoryViews()
    {
        super.factoryViews()
        
        let label:UILabel = UILabel()
        label.isUserInteractionEnabled = false
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.clear
        label.font = UIFont.regular(size:ViewNewAddListCellInfoTitle.Constants.contentFontSize)
        label.textColor = UIColor.colourBackgroundDark
        label.numberOfLines = 0
        self.label = label
        
        self.addSubview(label)
        
        NSLayoutConstraint.equalsVertical(
            view:label,
            toView:self)
        NSLayoutConstraint.leftToLeft(
            view:label,
            toView:self,
            constant:ViewNewAddList.Constants.marginHorizontal)
        NSLayoutConstraint.widthGreaterOrEqual(
            view:label)
    }
    
    override func config(
        controller:ControllerNewAdd,
        model:NewAddSectionItemProtocol)
    {
        super.config(
            controller:controller,
            model:model)
    }
}
