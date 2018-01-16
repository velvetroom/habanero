import UIKit

struct CookStepItemImage:CookStepItemProtocol
{
    let reusableIdentifier:String = ViewCookStepListCellImage.reusableIdentifier
    let text:String
    var image:UIImage?
    
    init(text:String)
    {
        self.text = text
    }
}
