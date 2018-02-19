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
    }
}
