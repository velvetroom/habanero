import UIKit

final class ViewOptionsList:ViewCollection<ArchOptions, ViewCollectionCell, ViewCollectionFlow>
{
    override func factoryViews()
    {
        super.factoryViews()
        
        self.flow.minimumLineSpacing = ViewOptionsList.Constants.interItemSpace
        self.flow.minimumInteritemSpacing = ViewOptionsList.Constants.interItemSpace
        self.flow.sectionInset = UIEdgeInsets(
            top:ViewOptionsList.Constants.interItemSpace,
            left:0,
            bottom:ViewGlobal.Constants.menuHeight + ViewOptionsList.Constants.interItemSpace,
            right:0)
    }
    
    override func collectionView(
        _ collectionView:UICollectionView,
        numberOfItemsInSection section:Int) -> Int
    {
        let count:Int = self.controller.model.items.count
        
        return count
    }
}
