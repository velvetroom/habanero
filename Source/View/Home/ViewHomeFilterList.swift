import UIKit

final class ViewHomeFilterList:ViewCollection<ArchHome, ViewHomeFilterListCell, ViewCollectionFlow>
{
    private weak var cellSize:CGSize?
    
    override func factoryViews()
    {
        super.factoryViews()
        
        
    }
    
    override func collectionView(
        _ collectionView:UICollectionView,
        numberOfItemsInSection section:Int) -> Int
    {
        let count:Int = self.controller.model.filterOptions.count
        
        return count
    }
    
    override func collectionView(
        _ collectionView:UICollectionView,
        layout collectionViewLayout:UICollectionViewLayout,
        sizeForItemAt indexPath:IndexPath) -> CGSize
    {
        guard
        
            let cellSize:CGSize = self.cellSize
        
        else
        {
            let width:CGFloat = collectionView.bounds.width
            let totalCells:CGFloat = CGFloat(collectionView.numberOfItems(inSection:0))
            let widthPerCell:CGFloat = width / totalCells
            let height:CGFloat = collectionView.bounds.height
            let cellSize:CGSize = CGSize(
                width:widthPerCell,
                height:height)
            self.cellSize = cellSize
            
            return cellSize
        }
        
        return cellSize
    }
    
    override func collectionView(
        _ collectionView:UICollectionView,
        cellForItemAt indexPath:IndexPath) -> UICollectionViewCell
    {
        
    }
    
    override func collectionView(
        _ collectionView:UICollectionView,
        shouldSelectItemAt indexPath:IndexPath) -> Bool
    {
        return false
    }
    
    override func collectionView(
        _ collectionView:UICollectionView,
        shouldHighlightItemAt indexPath:IndexPath) -> Bool
    {
        return false
    }
}
