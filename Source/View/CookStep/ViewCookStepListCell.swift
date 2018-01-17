import UIKit

class ViewCookStepListCell:ViewCollectionCell
{
    private(set) weak var labelText:UILabel!
    
    override func factoryViews()
    {
        super.factoryViews()
        self.isUserInteractionEnabled = false
        
        let labelText:UILabel = UILabel()
        labelText.translatesAutoresizingMaskIntoConstraints = false
        labelText.isUserInteractionEnabled = false
        labelText.backgroundColor = UIColor.clear
        labelText.numberOfLines = 0
        labelText.font = UIFont.regular(size:ViewCookStepListCell.Constants.textFontSize)
        labelText.textColor = UIColor.colourBackgroundDark
        self.labelText = labelText
        
        self.addSubview(labelText)
        
        NSLayoutConstraint.equalsHorizontal(
            view:labelText,
            toView:self,
            margin:ViewCookStepListCell.Constants.textMarginHorizontal)
        NSLayoutConstraint.bottomToBottom(
            view:labelText,
            toView:self)
    }
    
    //MARK: internal
    
    func config(
        controller:ControllerCookStep,
        item:CookStepItemProtocol) { }
}
