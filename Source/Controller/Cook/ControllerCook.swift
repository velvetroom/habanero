import Foundation

final class ControllerCook:Controller<ArchCook>
{
    init(recipe:Recipe)
    {
        super.init()
        
        self.model.recipe = recipe
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
