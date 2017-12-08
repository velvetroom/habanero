import Foundation

final class ControllerText:Controller<ArchText>
{
    init(
        text:String,
        completion:@escaping((String) -> ()))
    {
        super.init()
        
        self.model.text = text
        self.model.completion = completion
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func viewDidAppear(_ animated:Bool)
    {
        super.viewDidAppear(animated)
        
        guard
        
            let view:ViewText = self.view as? ViewText
        
        else
        {
            return
        }
        
        view.viewInput.becomeFirstResponder()
    }
}
