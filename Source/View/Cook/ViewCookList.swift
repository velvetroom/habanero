import UIKit

final class ViewCookList:ViewCollection<ArchCook, ViewCookListCell, ViewCollectionFlow>
{
    override func factoryViews()
    {
        super.factoryViews()
        self.collectionView.alwaysBounceVertical = true

        self.registerCell(cell:ViewCookListCellTitle.self)
        self.registerCell(cell:ViewCookListCellIngredientsTitle.self)
        self.registerCell(cell:ViewCookListCellIngredient.self)
        
        self.flow.minimumLineSpacing = ViewGlobal.Constants.interCellSpace
        self.flow.minimumInteritemSpacing = ViewGlobal.Constants.interCellSpace
    }
    
    override func collectionView(
        _ collectionView:UICollectionView,
        layout collectionViewLayout:UICollectionViewLayout,
        insetForSectionAt section:Int) -> UIEdgeInsets
    {
        
    }
}
