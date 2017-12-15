import UIKit

extension ViewNewAddIngredientAmountList
{
    //MARK: internal
    
    func modelAtIndex(index:IndexPath) -> NewAddIngredientAmountTypeProtocol
    {
        let item:NewAddIngredientAmountTypeProtocol = self.controller.model.types[index.item]
        
        return item
    }
    
    func selectIndex(index:IndexPath?)
    {
        self.collectionView.selectItem(
            at:index,
            animated:true,
            scrollPosition:UICollectionViewScrollPosition())
    }
}
