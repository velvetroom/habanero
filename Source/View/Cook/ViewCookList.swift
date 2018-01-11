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
        let width:CGFloat = collectionView.bounds.width
        
        let insets:UIEdgeInsets = UIEdgeInsets(
            top:width,
            left:0,
            bottom:ViewCookList.Constants.insetsBottom,
            right:0)
        
        return insets
    }
    
    override func collectionView(
        _ collectionView:UICollectionView,
        layout collectionViewLayout:UICollectionViewLayout,
        sizeForItemAt indexPath:IndexPath) -> CGSize
    {
        let item:CookItemProtocol = self.modelAtIndex(index:indexPath)
        let width:CGFloat = collectionView.bounds.width
        
        let size:CGSize = CGSize(
            width:width,
            height:item.cellHeight)
        
        return size
    }
    
    override func collectionView(
        _ collectionView:UICollectionView,
        numberOfItemsInSection section:Int) -> Int
    {
        let count:Int = self.controller.model.items.count
        
        return count
    }
    
    override func collectionView(
        _ collectionView:UICollectionView,
        cellForItemAt indexPath:IndexPath) -> UICollectionViewCell
    {
        let item:CookItemProtocol = self.modelAtIndex(index:indexPath)
        
        let cell:ViewCookListCell = self.cellAtIndex(
            indexPath:indexPath,
            reusableIdentifier:item.reusableIdentifier)
        
        cell.config(model:item)
        
        return cell
    }
}
