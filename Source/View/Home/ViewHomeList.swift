import UIKit

final class ViewHomeList:ViewCollection<ArchHome, ViewHomeListCell, UICollectionViewFlowLayout>
{
    private var cellSize:CGSize?
    
    override func factoryViews()
    {
        super.factoryViews()
        self.collectionView.alwaysBounceVertical = true
        self.collectionView.showsVerticalScrollIndicator = true
        
        self.flow.minimumLineSpacing = ViewHomeList.Constants.padding
        self.flow.minimumInteritemSpacing = ViewHomeList.Constants.padding
        self.flow.sectionInset = UIEdgeInsets(
            top:ViewHomeList.Constants.padding,
            left:0,
            bottom:ViewHomeList.Constants.padding,
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
            let padding:CGFloat = ViewHomeList.Constants.padding * 2
            let width:CGFloat = collectionView.bounds.width
            let height:CGFloat = width - padding
            
            let cellSize:CGSize = CGSize(
                width:width,
                height:height)
            
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
}
