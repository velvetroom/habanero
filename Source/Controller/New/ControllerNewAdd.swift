import UIKit

final class ControllerNewAdd:Controller<ArchNewAdd>
{
    init(
        build:Build,
        database:Database)
    {
        super.init()
        
        self.model.database = database
        self.model.build = build
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: internal
    
    func transitionBack()
    {
        self.parentController?.pop(horizontal:ControllerTransition.Horizontal.right)
    }
}
