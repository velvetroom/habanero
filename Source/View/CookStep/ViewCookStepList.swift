import UIKit

final class ViewCookStepList:ViewCollection<ArchCookStep, ViewCookStepListCell, ViewCollectionFlow>
{
    private var cellSize:CGSize?
    
    override func factoryViews()
    {
        super.factoryViews()
        self.collectionView.alwaysBounceHorizontal = true
        self.collectionView.isPagingEnabled = true
        self.registerCell(cell:ViewCookStepListCellText.self)
        self.registerCell(cell:ViewCookStepListCellImage.self)
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
            let cellSize:CGSize = collectionView.bounds.size
            self.cellSize = cellSize
            
            return cellSize
        }
        
        return cellSize
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
        let item:CookStepItemProtocol = self.modelAtIndex(index:indexPath)
        
        let cell:ViewCookStepListCell = self.cellAtIndex(
            indexPath:indexPath,
            reusableIdentifier:item.reusableIdentifier)
        
        cell.config(
            controller:self.controller,
            item:item)
        
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