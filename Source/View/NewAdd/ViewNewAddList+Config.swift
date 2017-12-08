import UIKit

extension ViewNewAddList
{
    //MARK: internal
    
    func config()
    {
        self.collectionView.alwaysBounceVertical = true
        
        self.registerHeader(header:ViewNewAddListHeader.self)
        self.registerFooter(footer:ViewNewAddListFooterInfo.self)
        self.registerFooter(footer:ViewNewAddListFooterIngredients.self)
        self.registerFooter(footer:ViewNewAddListFooterSteps.self)
        
        self.flow.minimumLineSpacing = ViewGlobal.Constants.interCellSpace
        self.flow.minimumInteritemSpacing = ViewGlobal.Constants.interCellSpace
        self.flow.footerReferenceSize = CGSize(
            width:0,
            height:ViewNewAddList.Constants.footerHeight)
    }
}
