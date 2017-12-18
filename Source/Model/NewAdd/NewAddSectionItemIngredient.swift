import UIKit

struct NewAddSectionItemIngredient:NewAddSectionItemProtocol
{
    let reusableIdentifier:String = ViewNewAddListCellIngredient.reusableIdentifier
    let cellHeight:CGFloat = NewAdd.Constants.cellIngredientHeight
    let name:String
    let amount:String
    weak var ingredient:BuildIngredient?
}
