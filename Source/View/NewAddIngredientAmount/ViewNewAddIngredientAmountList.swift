import UIKit

final class ViewNewAddIngredientAmountList:ViewCollection
    <ArchNewAddIngredientAmount,
    ViewNewAddIngredientAmountListCell,
    ViewCollectionFlow>
{
    private var cellSize:CGSize?
    
    override func factoryViews()
    {
        super.factoryViews()
        
        self.collectionView.bounces = false
        self.collectionView.isScrollEnabled = false
        
        let insetsTop:CGFloat = ViewNewAddIngredientAmountList.Constants.collectionTop +
                                ViewGlobal.Constants.barHeight +
                                ViewNewAddIngredientAmount.Constants.inputHeight
        
        self.flow.minimumLineSpacing = ViewGlobal.Constants.interCellSpace
        self.flow.minimumInteritemSpacing = ViewGlobal.Constants.interCellSpace
        self.flow.sectionInset = UIEdgeInsets(
            top:insetsTop,
            left:0,
            bottom:ViewNewAddIngredientAmountList.Constants.collectionBottom,
            right:0)
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
            let width:CGFloat = self.bounds.width
            
            let cellSize:CGSize = CGSize(
                width:width,
                height:ViewNewAddIngredientAmountList.Constants.cellHeight)
            
            self.cellSize = cellSize
            
            return cellSize
        }
        
        return cellSize
    }
    
    override func collectionView(
        _ collectionView:UICollectionView,
        numberOfItemsInSection section:Int) -> Int
    {
        let count:Int = self.controller.model.types.count
        
        return count
    }
    
    override func collectionView(
        _ collectionView:UICollectionView,
        cellForItemAt indexPath:IndexPath) -> UICollectionViewCell
    {
        let item:NewAddIngredientAmountTypeProtocol = self.modelAtIndex(index:indexPath)
        let cell:ViewNewAddIngredientAmountListCell = self.cellAtIndex(indexPath:indexPath)
        cell.config(model:item)
        
        return cell
    }
    
    override func collectionView(
        _ collectionView:UICollectionView,
        didSelectItemAt indexPath:IndexPath)
    {
        let item:NewAddIngredientAmountTypeProtocol = self.modelAtIndex(index:indexPath)
        
        self.controller.selectType(item:item)
    }
}
