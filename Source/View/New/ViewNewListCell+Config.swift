import UIKit

extension ViewNewListCell
{
    //MARK: internal
    
    func config(model:NewItem)
    {
        self.showState()
        self.viewSteps.config(model:model)
    }
}
