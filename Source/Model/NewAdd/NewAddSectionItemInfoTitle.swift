import UIKit

struct NewAddSectionItemInfoTitle:NewAddSectionItemProtocol
{
    let reusableIdentifier:String = ViewNewAddListCellInfoTitle.reusableIdentifier
    let cellHeight:CGFloat = NewAdd.Constants.cellInfoTitleHeight
    let title:String?
}
