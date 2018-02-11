import UIKit

final class ViewHomeFilterListCellShow:ViewHomeFilterListCell
{
    private weak var buttonAll:UIButton!
    private weak var buttonFavourites:UIButton!
    
    override func factoryViews()
    {
        super.factoryViews()
        
        let buttonAll:UIButton = UIButton()
        self.buttonAll = buttonAll
        
        let buttonFavourites:UIButton = UIButton()
        self.buttonFavourites = buttonFavourites
        
        self.addSubview(buttonAll)
        self.addSubview(buttonFavourites)
    }
    
    override func config(controller:ControllerHome)
    {
        super.config(controller:controller)
        
        controller.configFilterShow(viewCell:self)
    }
}
