import UIKit

final class ViewOptionsList:ViewCollection<ArchOptions, ViewCollectionCell, ViewCollectionFlow>
{
    override func factoryViews()
    {
        super.factoryViews()
        
        self.collectionView.alwaysBounceVertical = true
        
        self.flow.minimumLineSpacing = ViewOptionsList.Constants.interItemSpace
        self.flow.minimumInteritemSpacing = ViewOptionsList.Constants.interItemSpace
        self.flow.sectionInset = UIEdgeInsets(
            top:ViewOptionsList.Constants.interItemSpace,
            left:0,
            bottom:ViewGlobal.Constants.menuHeight + ViewOptionsList.Constants.interItemSpace,
            right:0)
        
        self.registerCell(cell:ViewOptionsListCellMetrics.self)
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
        let width:CGFloat = self.bounds.width
        let item:OptionsItemProtocol = self.modelAtIndex(index:indexPath)
        let size:CGSize = CGSize(
            width:width,
            height:item.cellHeight)
        
        return size
    }
    
    override func collectionView(
        _ collectionView:UICollectionView,
        cellForItemAt indexPath:IndexPath) -> UICollectionViewCell
    {
        let item:OptionsItemProtocol = self.modelAtIndex(index:indexPath)
        
        let cell:ViewOptionsListCell = self.cellAtIndex(
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
