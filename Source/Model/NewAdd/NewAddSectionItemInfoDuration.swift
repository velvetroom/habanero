import UIKit

struct NewAddSectionItemInfoDuration:NewAddSectionItemProtocol
{
    let reusableIdentifier:String = ViewNewAddListCellInfoDuration.reusableIdentifier
    let cellHeight:CGFloat = NewAdd.Constants.cellDurationTitleHeight
    let duration:TimeInterval
}
