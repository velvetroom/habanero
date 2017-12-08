import UIKit

final class ViewNewAddList:ViewCollection<ArchNewAdd, ViewNewListCell, ViewCollectionFlow>
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
        let section:NewAddSectionProtocol = self.controller.model.sections[section]
        let size:CGSize = CGSize(
            width:0,
            height:section.headerHeight)
        
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
        let count:Int = self.controller.model.sections[section].items.count
        
        return count
    }
    
    override func collectionView(
        _ collectionView:UICollectionView,
        viewForSupplementaryElementOfKind kind:String,
        at indexPath:IndexPath) -> UICollectionReusableView
    {
        let section:NewAddSectionProtocol = self.controller.model.sections[indexPath.section]
        let header:ViewNewAddListHeader = self.reusableAtIndex(
            kind:kind,
            indexPath:indexPath)
        header.config(model:section)
        
        return header
    }
}
