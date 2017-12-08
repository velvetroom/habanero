import Foundation

final class ControllerText:Controller<ArchText>
{
    private let completion:((String) -> ())
    
    init(
        text:String,
        completion:@escaping((String) -> ()))
    {
        self.completion = completion
        
        super.init()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
