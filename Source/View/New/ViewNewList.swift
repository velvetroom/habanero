import UIKit

final class ViewNewList:ViewCollection<ArchNew,  ViewNewListCell, ViewCollectionFlow>
{
    private var cellSize:CGSize?
    
    required init(controller:ControllerNew)
    {
        super.init(controller:controller)
        
        self.config()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
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
        layout collectionViewLayout:UICollectionViewLayout,
        sizeForItemAt indexPath:IndexPath) -> CGSize
    {
        guard
        
            let cellSize:CGSize = self.cellSize
        
        else
        {
            let width:CGFloat = collectionView.bounds.width
            
            let cellSize:CGSize = CGSize(
                width:width,
                height:ViewNewList.Constants.cellHeight)
            self.cellSize = cellSize
            
            return cellSize
        }
        
        return cellSize
    }
    
    override func collectionView(
        _ collectionView:UICollectionView,
        viewForSupplementaryElementOfKind kind:String,
        at indexPath:IndexPath) -> UICollectionReusableView
    {
        let header:ViewNewListHeader = self.reusableAtIndex(
            kind:kind,
            indexPath:indexPath)
        
        return header
    }
    
    override func collectionView(
        _ collectionView:UICollectionView,
        cellForItemAt indexPath:IndexPath) -> UICollectionViewCell
    {
        let item:NewItem = self.modelAtIndex(index:indexPath)
        let cell:ViewNewListCell = self.cellAtIndex(indexPath:indexPath)
        cell.config(model:item)
        
        return cell
    }
}
