import UIKit

final class ViewOptionsListCellMetrics:ViewOptionsListCell
{
    private weak var viewSegmented:UISegmentedControl!
    
    override func factoryViews()
    {
        let segmentedItems:[String] = ViewOptionsListCellMetrics.factorySegmentedItems()
        
        super.factoryViews()
        
        let labelTitle:UILabel = UILabel()
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.isUserInteractionEnabled = false
        labelTitle.backgroundColor = UIColor.clear
        labelTitle.font = UIFont.bold(size:ViewOptionsListCellMetrics.Constants.titleFontSize)
        labelTitle.textColor = UIColor.colourBackgroundDark
        labelTitle.text = String.localizedView(key:"ViewOptionsListCellMetrics_labelTitle")
        
        let viewSegmented:UISegmentedControl = UISegmentedControl(items:segmentedItems)
        viewSegmented.translatesAutoresizingMaskIntoConstraints = false
        viewSegmented.backgroundColor = UIColor.white
        viewSegmented.tintColor = UIColor.colourBackgroundDark
        self.viewSegmented = viewSegmented
        
        self.addSubview(labelTitle)
        self.addSubview(viewSegmented)
        
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
        
        NSLayoutConstraint.topToBottom(
            view:viewSegmented,
            toView:labelTitle)
        NSLayoutConstraint.heightGreaterOrEqual(
            view:viewSegmented)
        NSLayoutConstraint.equalsHorizontal(
            view:viewSegmented,
            toView:self,
            margin:ViewOptionsList.Constants.padding)
    }
}
