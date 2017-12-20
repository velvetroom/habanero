import UIKit

final class ControllerPhoto:Controller<ArchPhoto>
{
    init(completion:@escaping((UIImage?) -> ()))
    {
        super.init()
        
        self.model.completion = completion
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: internal
    
    func selectedOption(option:PhotoOptionProtocol)
    {
        option.router(self)()
    }
}
