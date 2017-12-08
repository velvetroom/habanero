import UIKit

final class ControllerText:Controller<ArchText>, UITextViewDelegate
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
        
        self.viewMain.viewInput.delegate = self
        self.viewMain.viewInput.becomeFirstResponder()
    }
    
    //MARK: internal
    
    func doneEditing()
    {
        self.viewMain.viewInput.resignFirstResponder()
        self.model.sendCompletion()
        self.parentController?.pop(vertical:ControllerTransition.Vertical.bottom)
    }
    
    //MARK: textView delegate
    
    func textViewDidEndEditing(_ textView:UITextView)
    {
        self.model.text = textView.text
    }
}
