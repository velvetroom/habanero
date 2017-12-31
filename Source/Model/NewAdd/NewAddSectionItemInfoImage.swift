import UIKit

struct NewAddSectionItemInfoImage:NewAddSectionItemProtocol
{
    let reusableIdentifier:String = ViewNewAddListCellInfoImage.reusableIdentifier
    let cellHeight:CGFloat = NewAdd.Constants.cellInfoImageHeight
    let image:UIImage?
}
