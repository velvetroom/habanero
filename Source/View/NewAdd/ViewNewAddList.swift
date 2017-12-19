import UIKit

final class ViewNewAddList:ViewCollection<ArchNewAdd, ViewNewAddListCell, ViewCollectionFlow>
{
    override func factoryViews()
    {
        super.factoryViews()
        
        self.collectionView.alwaysBounceVertical = true
        
        self.registerHeader(header:ViewNewAddListHeader.self)
        self.registerFooter(footer:ViewNewAddListFooterInfo.self)
        self.registerFooter(footer:ViewNewAddListFooterIngredients.self)
        self.registerFooter(footer:ViewNewAddListFooterSteps.self)
        self.registerCell(cell:ViewNewAddListCellInfoTitle.self)
        self.registerCell(cell:ViewNewAddListCellInfoDuration.self)
        self.registerCell(cell:ViewNewAddListCellIngredient.self)
        
        self.flow.minimumLineSpacing = ViewGlobal.Constants.interCellSpace
        self.flow.minimumInteritemSpacing = ViewGlobal.Constants.interCellSpace
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
        referenceSizeForFooterInSection section:Int) -> CGSize
    {
        let sectionModel:NewAddSectionProtocol = self.sectionAtIndex(section:section)
        
        let size:CGSize = CGSize(
            width:0,
            height:sectionModel.footerHeight)
        
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
        let reusable:ViewCollectionReusable
        
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
