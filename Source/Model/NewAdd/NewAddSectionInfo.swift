import UIKit

struct NewAddSectionInfo:NewAddSectionProtocol
{
    let title:String
    let footerReusableIdentifier:String
    let headerHeight:CGFloat
    let items:[NewAddSectionItemProtocol]
    
    init()
    {
        self.title = String.localizedModel(key:"NewAdd_infoSectionTitle")
        self.footerReusableIdentifier = ViewNewAddListFooterInfo.reusableIdentifier
        self.headerHeight = NewAdd.Constants.headerInfoHeight
        self.items = NewAddSectionInfo.factoryItems()
    }
    
    //MARK: private
    
    private static func factoryItems() -> [NewAddSectionItemProtocol]
    {
        let itemTitle:NewAddSectionItemInfoTitle = NewAddSectionItemInfoTitle(title:nil)
        
        let items:[NewAddSectionItemProtocol] = [
            itemTitle]
        
        return items
    }
}
