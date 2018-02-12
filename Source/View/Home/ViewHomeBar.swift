import UIKit

final class ViewHomeBar:ViewBar<ArchHome>
{
    private weak var buttonFilters:UIButton!
    
    override func factoryViews()
    {
        super.factoryViews()
        self.labelTitle.text = String.localizedView(key:"ViewHomeBar_labelTitle")
        
        let buttonFilters:UIButton = UIButton()
        self.buttonFilters = buttonFilters
        
        self.addSubview(buttonFilters)
        
        NSLayoutConstraint.topToTop(
            view:buttonFilters,
            toView:self,
            constant:ViewGlobal.Constants.contentTop)
        NSLayoutConstraint.bottomToBottom(
            view:buttonFilters,
            toView:self)
        NSLayoutConstraint.rightToRight(
            view:buttonFilters,
            toView:self)
    }
}
