import UIKit

final class ViewNewAdd:ViewMain<ArchNewAdd>
{
    required init(controller:ControllerNewAdd)
    {
        super.init(controller:controller)
        self.backgroundColor = UIColor.colourBackgroundGray
        
        self.factoryViews()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: private
    
    private func factoryViews()
    {
        let viewBar:ViewNewAddBar = ViewNewAddBar(controller:controller)
        
        addSubview(viewBar)
        
        NSLayoutConstraint.topToTop(
            view:viewBar,
            toView:self)
        NSLayoutConstraint.height(
            view:viewBar,
            constant:ViewGlobal.Constants.barHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:viewBar,
            toView:self)
    }
}
