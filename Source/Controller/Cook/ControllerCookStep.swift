import Foundation

final class ControllerCookStep:Controller<ArchCookStep>
{
    init(item:HomeItem)
    {
        super.init()
        
        self.model.homeItem = item
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
