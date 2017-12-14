import UIKit

final class ViewNewAddListCellIngredient:ViewNewAddListCell
{
    private weak var label:UILabel!
    private let attributesName:[NSAttributedStringKey:Any]
    private let attributesAmount:[NSAttributedStringKey:Any]
    
    override init(frame:CGRect)
    {
        self.attributesName = [
            NSAttributedStringKey.font : UIFont.regular(size:ViewNewAddListCellIngredient.Constants.nameFontSize),
            NSAttributedStringKey.foregroundColor : UIColor.colourBackgroundDark]
        
        self.attributesAmount = [
            NSAttributedStringKey.font :
                UIFont.regular(size:ViewNewAddListCellIngredient.Constants.amountFontSize),
            NSAttributedStringKey.foregroundColor : UIColor(white:0, alpha:0.6)]
        
        super.init(frame:frame)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func factoryViews()
    {
        super.factoryViews()
        
        let label:UILabel = UILabel()
        label.isUserInteractionEnabled = false
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.clear
        label.numberOfLines = 0
        self.label = label
        
        let removeButton:UIButton = UIButton()
        removeButton.translatesAutoresizingMaskIntoConstraints = false
        removeButton.setImage(
            #imageLiteral(resourceName: "assetGenericRemove").withRenderingMode(UIImageRenderingMode.alwaysOriginal),
            for:UIControlState.normal)
        removeButton.setImage(
            #imageLiteral(resourceName: "assetGenericRemove").withRenderingMode(UIImageRenderingMode.alwaysTemplate),
            for:UIControlState.highlighted)
        removeButton.imageView!.tintColor = UIColor(white:0, alpha:0.2)
        removeButton.imageView!.clipsToBounds = true
        removeButton.imageView!.contentMode = UIViewContentMode.center
        
        self.addSubview(label)
        self.addSubview(removeButton)
        
        NSLayoutConstraint.equalsVertical(
            view:label,
            toView:self)
        NSLayoutConstraint.leftToLeft(
            view:label,
            toView:self,
            constant:ViewNewAddList.Constants.marginHorizontal)
        NSLayoutConstraint.rightToLeft(
            view:label,
            toView:removeButton)
        
        NSLayoutConstraint.equalsVertical(
            view:removeButton,
            toView:self)
        NSLayoutConstraint.rightToRight(
            view:removeButton,
            toView:self)
        NSLayoutConstraint.width(
            view:removeButton,
            constant:ViewNewAddListCellIngredient.Constants.buttonWidth)
    }
    
    override func config(
        controller:ControllerNewAdd,
        model:NewAddSectionItemProtocol)
    {
        super.config(
            controller:controller,
            model:model)
        
        self.
    }
    
    //MARK: private
    
    private func showInfo()
}
