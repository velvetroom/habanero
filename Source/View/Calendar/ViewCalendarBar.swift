import UIKit

final class ViewCalendarBar:View<ArchCalendar>
{
    private(set) weak var labelTitle:UILabel!
    
    override func factoryViews()
    {
        super.factoryViews()
        
        let labelTitle:UILabel = UILabel()
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.backgroundColor = UIColor.clear
        labelTitle.isUserInteractionEnabled = false
        self.labelTitle = labelTitle
        
        self.addSubview(labelTitle)
        
        NSLayoutConstraint.height(
            view:labelTitle,
            constant:ViewCalendarBar.Constants.titleHeight)
        NSLayoutConstraint.bottomToBottom(
            view:labelTitle,
            toView:self)
        NSLayoutConstraint.leftToLeft(
            view:labelTitle,
            toView:self,
            constant:ViewCalendarBar.Constants.titleLeft)
        NSLayoutConstraint.widthGreaterOrEqual(
            view:labelTitle)
    }
}
