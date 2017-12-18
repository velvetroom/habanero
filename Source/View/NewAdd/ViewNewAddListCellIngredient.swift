import UIKit

final class ViewNewAddListCellIngredient:ViewNewAddListCell
{
    private weak var label:UILabel!
    private var model:NewAddSectionItemIngredient?
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
            NSAttributedStringKey.foregroundColor : UIColor(white:0, alpha:0.4)]
        
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
        removeButton.addTarget(
            self,
            action:#selector(self.selectorRemove(sender:)),
            for:UIControlEvents.touchUpInside)
        
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
        
        guard
        
            let model:NewAddSectionItemIngredient = model as? NewAddSectionItemIngredient
        
        else
        {
            return
        }
        
        self.model = model
        self.showInfo(model:model)
    }
    
    //MARK: selectors
    
    @objc
    private func selectorRemove(sender button:UIButton)
    {
        guard
        
            let model:NewAddSectionItemIngredient = self.model
        
        else
        {
            return
        }
        
        self.controller?.removeIngredient(item:model)
    }
    
    //MARK: private
    
    private func showInfo(model:NewAddSectionItemIngredient)
    {
        let newLine:NSAttributedString = NSAttributedString(string:"\n")
        
        let name:NSAttributedString = NSAttributedString(
            string:model.name,
            attributes:self.attributesName)
        
        let amount:NSAttributedString = NSAttributedString(
            string:model.amount,
            attributes:self.attributesAmount)
        
        let mutableString:NSMutableAttributedString = NSMutableAttributedString()
        mutableString.append(name)
        mutableString.append(newLine)
        mutableString.append(amount)
        
        self.label.attributedText = mutableString
    }
}
