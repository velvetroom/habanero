import UIKit

struct CookItemTitle:CookItemProtocol
{
    let reusableIdentifier:String = ViewCookListCellTitle.reusableIdentifier
    let cellHeight:CGFloat = Cook.Constants.titleCellHeight
    let recipe:Recipe
}
