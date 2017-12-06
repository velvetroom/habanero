import UIKit

final class ViewNewBar:ViewBar<ArchNew>
{
    required init(controller:ControllerNew)
    {
        super.init(controller:controller)
        
        factoryBarViews()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: private
    
    private func factoryBarViews()
    {
        let buttonAdd:UIButton = UIButton()
        buttonAdd.translatesAutoresizingMaskIntoConstraints = false
        buttonAdd.setTitleColor(
            UIColor.colourSuccess,
            for:UIControlState.normal)
        buttonAdd.setTitleColor(
            UIColor.colourGradientDark,
            for:UIControlState.highlighted)
        buttonAdd.setTitle(
            String.localizedView(key:"ViewNewBar_buttonAdd"),
            for:UIControlState())
        
        addSubview(buttonAdd)
        
        self.labelTitle.text = String.localizedView(key:"ViewNewBar_labelTitle")
        
        NSLayoutConstraint.topToTop(
            view:buttonAdd,
            toView:self,
            constant:ViewGlobal.Constants.contentTop)
        NSLayoutConstraint.leftToLeft(
            view:buttonAdd,
            toView:self)
        NSLayoutConstraint.width(
            view:buttonAdd,
            constant:0)
    }
}
