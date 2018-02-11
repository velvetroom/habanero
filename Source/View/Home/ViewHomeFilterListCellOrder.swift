import UIKit

final class ViewHomeFilterListCellOrder:ViewHomeFilterListCell
{
    private weak var buttonDate:UIButton!
    private weak var buttonFavourites:UIButton!
    
    override func factoryViews()
    {
        super.factoryViews()
        
        let buttonDate:UIButton = UIButton()
        self.buttonDate = buttonDate
        
        let buttonFavourites:UIButton = UIButton()
        self.buttonFavourites = buttonFavourites
        
        self.addSubview(buttonDate)
        self.addSubview(buttonFavourites)
    }
    
    override func config(controller:ControllerHome)
    {
        super.config(controller:controller)
        
        controller.configFilterOrder(viewCell:self)
    }
}
