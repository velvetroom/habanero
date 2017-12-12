import UIKit

final class ViewNewAddIngredientList:ViewCollection<
    ArchNewAddIngredient,
    ViewNewAddIngredientListCell,
    ViewCollectionFlow>
{
    private var cellSize:CGSize?
    
    override func factoryViews()
    {
        super.factoryViews()
        
        self.collectionView.alwaysBounceVertical = true
        
        self.registerHeader(header:ViewNewAddIngredientListHeader.self)
        self.registerFooter(footer:ViewNewAddIngredientListFooter.self)
        
        self.flow.minimumLineSpacing = ViewGlobal.Constants.interCellSpace
        self.flow.minimumInteritemSpacing = ViewGlobal.Constants.interCellSpace
        self.flow.sectionInset = UIEdgeInsets(
            top:ViewNewAddIngredient.Constants.barHeight,
            left:0,
            bottom:ViewNewAddIngredientList.Constants.collectionBottom,
            right:0)
    }
    
    override func collectionView(
        _ collectionView:UICollectionView,
        layout collectionViewLayout:UICollectionViewLayout,
        referenceSizeForHeaderInSection section:Int) -> CGSize
    {
        let countItems:Int = self.controller.model.items.count
        let searchLength:Int = self.controller.model.searching.count
        
        guard
        
            countItems == 0,
            searchLength == 0
        
        else
        {
            return CGSize.zero
        }
        
        let size:CGSize = CGSize(
            width:0,
            height:ViewNewAddIngredientList.Constants.headerHeight)
        
        return size
    }
    
    override func collectionView(
        _ collectionView:UICollectionView,
        layout collectionViewLayout:UICollectionViewLayout,
        referenceSizeForFooterInSection section:Int) -> CGSize
    {
        let countItems:Int = self.controller.model.items.count
        let searchLength:Int = self.controller.model.searching.count
        
        guard
            
            countItems == 0,
            searchLength > 0
            
        else
        {
            return CGSize.zero
        }
        
        let size:CGSize = CGSize(
            width:0,
            height:ViewNewAddIngredientList.Constants.footerHeight)
        
        return size
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
                height:ViewNewAddIngredientList.Constants.cellHeight)
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
        viewForSupplementaryElementOfKind kind:String,
        at indexPath:IndexPath) -> UICollectionReusableView
    {
        let reusable:ViewCollectionReusable
        
        if kind == UICollectionElementKindSectionHeader
        {
            reusable = self.headerAtIndex(index:indexPath)
        }
        else
        {
            reusable = self.footerAtIndex(index:indexPath)
        }
        
        return reusable
    }
    
    override func collectionView(
        _ collectionView:UICollectionView,
        cellForItemAt indexPath:IndexPath) -> UICollectionViewCell
    {
        let item:Ingredient = self.modelAtIndex(index:indexPath)
        let cell:ViewNewAddIngredientListCell = self.cellAtIndex(indexPath:indexPath)
        cell.config(model:item)
        
        return cell
    }
}
