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
}
