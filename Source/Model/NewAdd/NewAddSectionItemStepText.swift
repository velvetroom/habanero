import UIKit

struct NewAddSectionItemStepText:NewAddSectionItemProtocol, NewAddSectionItemStepProtocol
{
    let reusableIdentifier:String = ViewNewAddListCellStepText.reusableIdentifier
    let cellHeight:CGFloat = NewAdd.Constants.cellStepTextHeight
    let text:String
    weak var step:BuildStep?
}
