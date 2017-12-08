import UIKit

struct NewAddSectionIngredients:NewAddSectionProtocol
{
    let title:String
    let footerReusableIdentifier:String
    let headerHeight:CGFloat
    let items:[NewAddSectionItemProtocol]
    
    init(build:Build)
    {
        self.title = String.localizedModel(key:"NewAdd_ingredientsSectionTitle")
        self.footerReusableIdentifier = ViewNewAddListFooterIngredients.reusableIdentifier
        self.headerHeight = NewAdd.Constants.headerIngredientsHeight
        self.items = []
    }
}
