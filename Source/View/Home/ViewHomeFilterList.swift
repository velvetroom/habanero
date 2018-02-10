import UIKit

final class ViewHomeFilterList:ViewCollection<ArchHome, ViewHomeFilterListCell, ViewCollectionFlow>
{
    private var cellSize:CGSize?
    
    override func factoryViews()
    {
        super.factoryViews()
        self.collectionView.bounces = false
        self.collectionView.isScrollEnabled = false
        
        self.registerCell(cell:ViewHomeFilterListCellShow.self)
        self.registerCell(cell:ViewHomeFilterListCellOrder.self)
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
        let item:HomeFilterOptionsProtocol = self.modelAtIndex(index:indexPath)
        
        let cell:ViewHomeFilterListCell = self.cellAtIndex(
            indexPath:indexPath,
            reusableIdentifier:item.reusableIdentifier)
        
        cell.config(controller:self.controller)
        
        return cell
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
