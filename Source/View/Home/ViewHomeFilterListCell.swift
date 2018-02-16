import UIKit

class ViewHomeFilterListCell:ViewCollectionCell
{
    private(set) weak var controller:ControllerHome?
    private(set) weak var labelTitle:UILabel!
    
    override func factoryViews()
    {
        super.factoryViews()
        
        let labelTitle:UILabel = UILabel()
        labelTitle.isUserInteractionEnabled = false
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.backgroundColor = UIColor.clear
        labelTitle.font = UIFont.regular(size:ViewHomeFilterListCell.Constants.fontSize)
        labelTitle.textColor = UIColor.colourBackgroundDark
        self.labelTitle = labelTitle
        
        self.addSubview(labelTitle)
        
        NSLayoutConstraint.topToTop(
            view:labelTitle,
            toView:self)
        NSLayoutConstraint.height(
            view:labelTitle,
            constant:ViewHomeFilterListCell.Constants.titleHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:labelTitle,
            toView:self,
            margin:ViewHomeFilterListCell.Constants.titlePadding)
    }
    
    //MARK: internal
    
    func config(controller:ControllerHome)
    {
        self.controller = controller
    }
}
