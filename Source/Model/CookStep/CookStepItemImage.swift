import UIKit

struct CookStepItemImage:CookStepItemProtocol
{
    let reusableIdentifier:String = ViewCookStepListCellImage.reusableIdentifier
    let text:String
    let imageIdentifier:String
    var image:UIImage?
    
    init(
        text:String,
        imageIdentifier:String)
    {
        self.text = text
        self.imageIdentifier = imageIdentifier
    }
}
