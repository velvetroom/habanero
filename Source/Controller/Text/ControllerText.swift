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
        self.model.view?.viewInput.becomeFirstResponder()
    }
    
    //MARK: internal
    
    func doneEditing()
    {
        self.model.view?.viewInput.resignFirstResponder()
        self.model.sendCompletion()
        
        self.parentController?.pop(vertical:ControllerTransition.Vertical.bottom)
    }
}
