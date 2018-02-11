import UIKit

final class ViewHomeFilterListCellOrder:ViewHomeFilterListCell
{
    private weak var buttonDate:UIButton!
    private weak var buttonFavourites:UIButton!
    
    override func factoryViews()
    {
        super.factoryViews()
        
        let buttonDate:UIButton = UIButton()
        buttonDate.addTarget(
            self,
            action:#selector(self.selectorOrderByDate(sender:)),
            for:UIControlEvents.touchUpInside)
        self.buttonDate = buttonDate
        
        let buttonFavourites:UIButton = UIButton()
        buttonFavourites.addTarget(
            self,
            action:#selector(self.selectorOrderByFavourites(sender:)),
            for:UIControlEvents.touchUpInside)
        self.buttonFavourites = buttonFavourites
        
        self.addSubview(buttonDate)
        self.addSubview(buttonFavourites)
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
