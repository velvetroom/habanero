import Foundation

final class ControllerText:Controller<ArchText>
{
    init(
        text:String,
        completion:@escaping((String) -> ()))
    {
        
        super.init()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
