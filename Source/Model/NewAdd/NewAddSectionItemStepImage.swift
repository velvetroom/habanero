import UIKit

struct NewAddSectionItemStepImage:NewAddSectionItemProtocol, NewAddSectionItemStepProtocol
{
    let reusableIdentifier:String = ViewNewAddListCellStepImage.reusableIdentifier
    let cellHeight:CGFloat = NewAdd.Constants.cellStepImageHeight
    let image:UIImage
    let text:String
    weak var step:BuildStep?
}
