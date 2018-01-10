import UIKit

final class ViewNewList:ViewCollection<ArchNew,  ViewNewListCell, ViewCollectionFlow>
{
    private var cellSize:CGSize?
    
    override func factoryViews()
    {
        super.factoryViews()
        
        self.collectionView.alwaysBounceVertical = true
        self.registerHeader(header:ViewNewListHeader.self)
        
        self.flow.minimumLineSpacing = ViewGlobal.Constants.interCellSpace
        self.flow.minimumInteritemSpacing = ViewGlobal.Constants.interCellSpace
        self.flow.headerReferenceSize = CGSize(
            width:0,
            height:ViewNewList.Constants.headerHeight)
        self.flow.sectionInset = UIEdgeInsets(
            top:0,
            left:0,
            bottom:ViewGlobal.Constants.menuHeight + ViewNewList.Constants.collectionBottom,
            right:0)
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
    
    override func collectionView(
        _ collectionView:UICollectionView,
        didSelectItemAt indexPath:IndexPath)
    {
        super.collectionView(
            collectionView,
            didSelectItemAt:indexPath)
        
        let item:NewItem = self.modelAtIndex(index:indexPath)
        self.controller.transitionToNewAdd(build:item.build)
    }
}
