import UIKit

final class ViewPhotoList:ViewCollection<ArchPhoto, ViewPhotoListCell, ViewCollectionFlow>
{
    override func factoryViews()
    {
        super.factoryViews()
        
        self.collectionView.isScrollEnabled = false
        self.collectionView.bounces = false
        
        self.flow.itemSize = CGSize(
            width:ViewPhotoList.Constants.cellWidth,
            height:ViewPhotoList.Constants.cellHeight)
    }
    
    override func collectionView(
        _ collectionView:UICollectionView,
        layout collectionViewLayout:UICollectionViewLayout,
        insetForSectionAt section:Int) -> UIEdgeInsets
    {
        let width:CGFloat = collectionView.bounds.width
        let height:CGFloat = collectionView.bounds.height
        let cells:Int = self.collectionView.numberOfItems(inSection:0)
        let cellsHeight:CGFloat = CGFloat(cells) * ViewPhotoList.Constants.cellHeight
        let remainWidth:CGFloat = width - ViewPhotoList.Constants.cellWidth
        let marginHorizontal:CGFloat = remainWidth / 2.0
        let remainHeight:CGFloat = height - cellsHeight
        let marginTop:CGFloat = remainHeight / 2.0
        
        let sectionInsets:UIEdgeInsets = UIEdgeInsets(
            top:marginTop,
            left:marginHorizontal,
            bottom:0,
            right:marginHorizontal)
        
        return sectionInsets
    }
    
    override func collectionView(
        _ collectionView:UICollectionView,
        numberOfItemsInSection section:Int) -> Int
    {
        let count:Int = self.controller.model.options.count
        
        return count
    }
    
    override func collectionView(
        _ collectionView:UICollectionView,
        cellForItemAt indexPath:IndexPath) -> UICollectionViewCell
    {
        let item:PhotoOptionProtocol = self.modelAtIndex(index:indexPath)
        let cell:ViewPhotoListCell = self.cellAtIndex(indexPath:indexPath)
        cell.config(model:item)
        
        return cell
    }
    
    override func collectionView(
        _ collectionView:UICollectionView,
        didSelectItemAt indexPath:IndexPath)
    {
        collectionView.isUserInteractionEnabled = false
        
        let item:PhotoOptionProtocol = self.modelAtIndex(index:indexPath)
        
        self.controller.selectedOption(option:item)
    }
}
