import UIKit

final class ViewPhoto:ViewMain<ArchPhoto>
{
    override func factoryViews()
    {
        super.factoryViews()
        self.backgroundColor = UIColor.clear
        
        let viewBlur:ViewBlur = ViewBlur.light()
        
        let viewList:ViewPhotoList = ViewPhotoList(controller:self.controller)
        
        self.addSubview(viewBlur)
        self.addSubview(viewList)
        
        NSLayoutConstraint.equals(
            view:viewBlur,
            toView:self)
        
        NSLayoutConstraint.equals(
            view:viewList,
            toView:self)
    }
}
