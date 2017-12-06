import UIKit

extension ViewNew
{
    //MARK: internal
    
    func factoryViews()
    {
        let viewList:ViewNewList = ViewNewList(controller:controller)
        self.viewList = viewList
        
        addSubview(viewList)
        
        NSLayoutConstraint.equals(
            view:viewList,
            toView:self)
    }
}
