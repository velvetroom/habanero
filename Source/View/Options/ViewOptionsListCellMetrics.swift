import UIKit

final class ViewOptionsListCellMetrics:ViewOptionsListCell
{
    override func factoryViews()
    {
        super.factoryViews()
        
        let labelTitle:UILabel = UILabel()
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.isUserInteractionEnabled = false
        labelTitle.backgroundColor = UIColor.clear
        labelTitle.font = UIFont.bold(size:ViewOptionsListCellMetrics.Constants.titleFontSize)
        labelTitle.textColor = UIColor.colourBackgroundDark
        labelTitle.text = String.localizedView(key:"ViewOptionsListCellMetrics_labelTitle")
        
        self.addSubview(labelTitle)
        
        NSLayoutConstraint.topToTop(
            view:labelTitle,
            toView:self)
        NSLayoutConstraint.height(
            view:labelTitle,
            constant:ViewOptionsListCellMetrics.Constants.titleHeight)
        NSLayoutConstraint.leftToLeft(
            view:labelTitle,
            toView:self,
            constant:ViewOptionsList.Constants.padding)
        NSLayoutConstraint.widthGreaterOrEqual(
            view:labelTitle)
    }
}
