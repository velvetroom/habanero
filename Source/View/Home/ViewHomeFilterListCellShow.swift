import UIKit

final class ViewHomeFilterListCellShow:ViewHomeFilterListCell
{
    override func config(
        controller:ControllerHome,
        model:HomeFilterOptionsProtocol)
    {
        super.config(
            controller:controller,
            model:model)
        
        guard
        
            let model:HomeFilterOptionsShow = model as? HomeFilterOptionsShow
        
        else
        {
            return
        }
    }
}
