import UIKit

final class ViewHomeBar:ViewBar<ArchHome>
{
    private weak var buttonFilters:UIButton!
    
    override func factoryViews()
    {
        super.factoryViews()
        self.labelTitle.text = String.localizedView(key:"ViewHomeBar_labelTitle")
        
        let buttonFilters:UIButton = UIButton()
        buttonFilters.translatesAutoresizingMaskIntoConstraints = false
        buttonFilters.addTarget(
            self,
            action:#selector(self.selectorFilters(sender:)),
            for:UIControlEvents.touchUpInside)
        buttonFilters.setImage(
            #imageLiteral(resourceName: "assetGenericFilter").withRenderingMode(UIImageRenderingMode.alwaysOriginal),
            for:UIControlState.normal)
        buttonFilters.setImage(
            #imageLiteral(resourceName: "assetGenericFilter").withRenderingMode(UIImageRenderingMode.alwaysTemplate),
            for:UIControlState.highlighted)
        buttonFilters.imageView!.tintColor = UIColor.colourHabanero
        buttonFilters.imageView!.clipsToBounds = true
        buttonFilters.imageView!.contentMode = UIViewContentMode.center
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
        NSLayoutConstraint.width(
            view:buttonFilters,
            constant:ViewHomeBar.Constants.buttonFiltersWidth)
    }
    
    //MARK: selectors
    
    @objc
    private func selectorFilters(sender button:UIButton)
    {
        self.controller.toggleFilters()
    }
    
    //MARK: internal
    
    func showFilters()
    {
        self.buttonFilters.isSelected = true
    }
    
    func hideFilters()
    {
        self.buttonFilters.isSelected = false
    }
}
