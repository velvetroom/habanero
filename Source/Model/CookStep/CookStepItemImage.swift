import UIKit

final class CookStepItemImage:CookStepItemProtocol
{
    let reusableIdentifier:String = ViewCookStepListCellImage.reusableIdentifier
    let text:String
    let stepIdentifier:String
    var image:UIImage?
    
    init(
        text:String,
        stepIdentifier:String)
    {
        self.text = text
        self.stepIdentifier = stepIdentifier
    }
}
