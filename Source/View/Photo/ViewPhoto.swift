import UIKit

final class ViewPhoto:ViewMain<ArchPhoto>
{
    override func factoryViews()
    {
        super.factoryViews()
        self.backgroundColor = UIColor.clear
        
        let viewBlur:ViewBlur = ViewBlur.light()
        
        self.addSubview(ViewBlur)
        
        NSLayoutConstraint.equals(
            view:ViewBlur,
            toView:self)
    }
}
