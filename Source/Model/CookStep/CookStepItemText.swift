import Foundation

final class CookStepItemText:CookStepItemProtocol
{
    let reusableIdentifier:String = ViewCookStepListCellText.reusableIdentifier
    let text:String
    
    init(text:String)
    {
        self.text = text
    }
}
