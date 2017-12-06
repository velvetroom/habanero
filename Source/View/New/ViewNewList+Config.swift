import UIKit

extension ViewNewList
{
    //MARK: internal
    
    func config()
    {
        self.collectionView.alwaysBounceVertical = true
        self.registerHeader(header:ViewNewListHeader.self)
        
        self.flow.headerReferenceSize = CGSize(
            width:0,
            height:ViewNewList.Constants.headerHeight)
    }
}
