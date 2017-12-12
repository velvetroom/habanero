import UIKit

extension ViewNewAddIngredientList
{
    //MARK: internal
    
    func modelAtIndex(index:IndexPath) -> Ingredient
    {
        let item:Ingredient = self.controller.model.items[index.item]
        
        return item
    }
    
    func headerAtIndex(index:IndexPath) -> ViewNewAddIngredientListHeader
    {
        let header:ViewNewAddIngredientListHeader = self.reusableAtIndex(
            kind:UICollectionElementKindSectionHeader,
            indexPath:index)
        
        return header
    }
    
    func footerAtIndex(index:IndexPath) -> ViewNewAddIngredientListFooter
    {
        let footer:ViewNewAddIngredientListFooter = self.reusableAtIndex(
            kind:UICollectionElementKindSectionFooter,
            indexPath:index)
        footer.config(controller:self.controller)
        
        return footer
    }
}
