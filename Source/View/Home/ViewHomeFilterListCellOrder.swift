import UIKit

final class ViewHomeFilterListCellOrder:ViewHomeFilterListCell
{
    private weak var buttonDate:UIButton!
    private weak var buttonFavourites:UIButton!
    
    override func factoryViews()
    {
        super.factoryViews()
        
        self.labelTitle.textAlignment = NSTextAlignment.left
        self.labelTitle.text = String.localizedView(key:"ViewHomeFilterListCellOrder_labelTitle")
        
        let buttonDate:UIButton = UIButton()
        buttonDate.translatesAutoresizingMaskIntoConstraints = false
        buttonDate.setImage(
            #imageLiteral(resourceName: "assetGenericFilterOrderDateOff"),
            for:UIControlState.normal)
        buttonDate.setImage(
            #imageLiteral(resourceName: "assetGenericFilterOrderDateOn"),
            for:UIControlState.highlighted)
        buttonDate.setImage(
            #imageLiteral(resourceName: "assetGenericFilterOrderDateOn"),
            for:UIControlState.selected)
        buttonDate.imageView!.clipsToBounds = true
        buttonDate.imageView!.contentMode = UIViewContentMode.center
        buttonDate.addTarget(
            self,
            action:#selector(self.selectorOrderByDate(sender:)),
            for:UIControlEvents.touchUpInside)
        self.buttonDate = buttonDate
        
        let buttonFavourites:UIButton = UIButton()
        buttonFavourites.translatesAutoresizingMaskIntoConstraints = false
        buttonFavourites.setImage(
            #imageLiteral(resourceName: "assetGenericFilterOrderFavouritesOff"),
            for:UIControlState.normal)
        buttonFavourites.setImage(
            #imageLiteral(resourceName: "assetGenericFilterOrderFavouritesOn"),
            for:UIControlState.highlighted)
        buttonFavourites.setImage(
            #imageLiteral(resourceName: "assetGenericFilterOrderFavouritesOn"),
            for:UIControlState.selected)
        buttonFavourites.imageView!.clipsToBounds = true
        buttonFavourites.imageView!.contentMode = UIViewContentMode.center
        buttonFavourites.addTarget(
            self,
            action:#selector(self.selectorOrderByFavourites(sender:)),
            for:UIControlEvents.touchUpInside)
        self.buttonFavourites = buttonFavourites
        
        self.addSubview(buttonDate)
        self.addSubview(buttonFavourites)
        
        NSLayoutConstraint.topToTop(
            view:buttonDate,
            toView:self,
            constant:ViewHomeFilterListCell.Constants.contentTop)
        NSLayoutConstraint.bottomToBottom(
            view:buttonDate,
            toView:self)
        NSLayoutConstraint.leftToLeft(
            view:buttonDate,
            toView:self)
        NSLayoutConstraint.width(
            view:buttonDate,
            constant:ViewHomeFilterListCellOrder.Constants.buttonWidth)
        
        NSLayoutConstraint.topToTop(
            view:buttonFavourites,
            toView:self,
            constant:ViewHomeFilterListCell.Constants.contentTop)
        NSLayoutConstraint.bottomToBottom(
            view:buttonFavourites,
            toView:self)
        NSLayoutConstraint.leftToRight(
            view:buttonFavourites,
            toView:buttonDate)
        NSLayoutConstraint.width(
            view:buttonFavourites,
            constant:ViewHomeFilterListCellOrder.Constants.buttonWidth)
    }
    
    override func config(controller:ControllerHome)
    {
        super.config(controller:controller)
        
        controller.configFilterOrder(viewCell:self)
    }
    
    //MARK: Selectors
    
    @objc
    private func selectorOrderByDate(sender button:UIButton)
    {
        guard
        
            let controller:ControllerHome = self.controller
        
        else
        {
            return
        }
        
        controller.filterOrderByDate()
    }
    
    @objc
    private func selectorOrderByFavourites(sender button:UIButton)
    {
        guard
        
            let controller:ControllerHome = self.controller
        
        else
        {
            return
        }
        
        controller.filterOrderByFavourites()
    }
    
    //MARK: internal
    
    func showOrderedByDate()
    {
        self.buttonDate.isEnabled = false
        self.buttonFavourites.isEnabled = true
        
        self.buttonDate.isSelected = true
        self.buttonFavourites.isSelected = false
    }
    
    func showOrderedByFavourites()
    {
        self.buttonDate.isEnabled = true
        self.buttonFavourites.isEnabled = false
        
        self.buttonDate.isSelected = false
        self.buttonFavourites.isSelected = true
    }
}
