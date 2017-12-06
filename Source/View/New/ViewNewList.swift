import UIKit

final class ViewNewList:ViewCollection<ArchNew,  ViewNewListCell, ViewCollectionFlow>
{
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
        viewForSupplementaryElementOfKind kind:String,
        at indexPath:IndexPath) -> UICollectionReusableView
    {
        let header:ViewNewListHeader = self.reusableAtIndex(
            kind:kind,
            indexPath:indexPath)
        
        return header
    }
}
