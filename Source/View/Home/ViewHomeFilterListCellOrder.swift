import UIKit

final class ViewHomeFilterListCellOrder:ViewHomeFilterListCell
{
    override func config(
        controller:ControllerHome,
        model:HomeFilterOptionsProtocol)
    {
        super.config(
            controller:controller,
            model:model)
        
        guard
            
            let model:HomeFilterOptionsOrder = model
            
        else
        {
            return
        }
    }
}
