import Foundation

struct CookStepItemText:CookStepItemProtocol
{
    let reusableIdentifier:String = ViewCookStepListCellText.reusableIdentifier
    let text:String
    
    init(text:String)
    {
        self.text = text
    }
}
