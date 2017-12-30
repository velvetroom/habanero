import UIKit

struct NewAddSectionItemInfoSubtitle:NewAddSectionItemProtocol
{
    let reusableIdentifier:String = ViewNewAddListCellInfoSubtitle.reusableIdentifier
    let cellHeight:CGFloat = NewAdd.Constants.cellInfoSubtitleHeight
    let subtitle:String
}
