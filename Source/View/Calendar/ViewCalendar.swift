import UIKit

final class ViewCalendar:ViewMain<ArchCalendar>
{
    private(set) weak var viewBar:ViewCalendarBar!
    private(set) weak var viewList:ViewCalendarList!
    
    override func factoryViews()
    {
        super.factoryViews()
        
        let viewBar:ViewCalendarBar = ViewCalendarBar(controller:self.controller)
        self.viewBar = viewBar
        
        let viewList:ViewCalendarList = ViewCalendarList(controller:self.controller)
        self.viewList = viewList
        
        self.addSubview(viewList)
        self.addSubview(viewBar)
    }
}
