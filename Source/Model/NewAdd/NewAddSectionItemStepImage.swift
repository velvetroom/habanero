import UIKit

struct NewAddSectionItemStepImage:NewAddSectionItemProtocol
{
    let reusableIdentifier:String = ViewNewAddListCellStepText.reusableIdentifier
    let cellHeight:CGFloat = NewAdd.Constants.cellStepImageHeight
    let image:UIImage
    let text:String
    weak var step:BuildStepImage?
}
