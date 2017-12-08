import UIKit

final class ViewNewAddList:ViewCollection<ArchNewAdd, ViewNewAddListCell, ViewCollectionFlow>
{
    required init(controller:ControllerNewAdd)
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
        layout collectionViewLayout:UICollectionViewLayout,
        referenceSizeForHeaderInSection section:Int) -> CGSize
    {
        let sectionModel:NewAddSectionProtocol = self.sectionAtIndex(section:section)
        
        let size:CGSize = CGSize(
            width:0,
            height:sectionModel.headerHeight)
        
        return size
    }
    
    override func collectionView(
        _ collectionView:UICollectionView,
        layout collectionViewLayout:UICollectionViewLayout,
        sizeForItemAt indexPath:IndexPath) -> CGSize
    {
        let item:NewAddSectionItemProtocol = self.modelAtIndex(index:indexPath)
        let width:CGFloat = collectionView.bounds.width
        
        let size:CGSize = CGSize(
            width:width,
            height:item.cellHeight)
        
        return size
    }
    
    override func numberOfSections(in collectionView:UICollectionView) -> Int
    {
        let count:Int = self.controller.model.sections.count
        
        return count
    }
    
    override func collectionView(
        _ collectionView:UICollectionView,
        numberOfItemsInSection section:Int) -> Int
    {
        let sectionModel:NewAddSectionProtocol = self.sectionAtIndex(section:section)
        let count:Int = sectionModel.items.count
        
        return count
    }
    
    override func collectionView(
        _ collectionView:UICollectionView,
        viewForSupplementaryElementOfKind kind:String,
        at indexPath:IndexPath) -> UICollectionReusableView
    {
        let reusable:UICollectionReusableView
        
        if kind == UICollectionElementKindSectionHeader
        {
            reusable = self.dequeueHeaderAtIndex(index:indexPath)
        }
        else
        {
            reusable = self.dequeueFooterAtIndex(index:indexPath)
        }
        
        return reusable
    }
    
    override func collectionView(
        _ collectionView:UICollectionView,
        cellForItemAt indexPath:IndexPath) -> UICollectionViewCell
    {
        let item:NewAddSectionItemProtocol = self.modelAtIndex(index:indexPath)
        
        let cell:ViewNewAddListCell = self.cellAtIndex(
            indexPath:indexPath,
            reusableIdentifier:item.reusableIdentifier)
        
        cell.config(
            controller:self.controller,
            model:item)
        
        return cell
    }
}
