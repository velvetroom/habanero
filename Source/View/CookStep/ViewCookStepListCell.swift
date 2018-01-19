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
        labelText.textColor = UIColor.colourBackgroundDark
        self.labelText = labelText
        
        self.addSubview(labelText)
        
        NSLayoutConstraint.equalsHorizontal(
            view:labelText,
            toView:self,
            margin:ViewCookStepListCell.Constants.margin)
    }
    
    //MARK: internal
    
    func config(
        controller:ControllerCookStep,
        item:CookStepItemProtocol) { }
}
