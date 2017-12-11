import UIKit

final class ViewNewBar:ViewBar<ArchNew>
{
    override func factoryViews()
    {
        super.factoryViews()
        
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
        buttonAdd.titleLabel!.font = UIFont.bold(size:ViewGlobal.Constants.barTitleFontSize)
        buttonAdd.addTarget(
            self,
            action:#selector(self.selectorButtonAdd(sender:)),
            for:UIControlEvents.touchUpInside)
        
        self.labelTitle.text = String.localizedView(key:"ViewNewBar_labelTitle")
        
        self.addSubview(buttonAdd)
        
        NSLayoutConstraint.topToTop(
            view:buttonAdd,
            toView:self,
            constant:ViewGlobal.Constants.contentTop)
        NSLayoutConstraint.bottomToBottom(
            view:buttonAdd,
            toView:self)
        NSLayoutConstraint.rightToRight(
            view:buttonAdd,
            toView:self)
        NSLayoutConstraint.width(
            view:buttonAdd,
            constant:ViewNewBar.Constants.buttonAddWidth)
    }
    
    
    //MARK: selectors
    
    @objc
    private func selectorButtonAdd(sender button:UIButton)
    {
        self.controller.createBuildAndTransitionToNewAdd()
    }
}
