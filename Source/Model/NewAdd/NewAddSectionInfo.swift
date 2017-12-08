import UIKit

struct NewAddSectionInfo:NewAddSectionProtocol
{
    let title:String
    let footerReusableIdentifier:String
    let headerHeight:CGFloat
    let items:[NewAddSectionItemProtocol]

    init(build:Build)
    {
        self.title = String.localizedModel(key:"NewAdd_infoSectionTitle")
        self.footerReusableIdentifier = ViewNewAddListFooterInfo.reusableIdentifier
        self.headerHeight = NewAdd.Constants.headerInfoHeight
        self.items = NewAddSectionInfo.factoryItems(build:build)
    }
    
    //MARK: private
    
    private static func factoryItems(build:Build) -> [NewAddSectionItemProtocol]
    {
        let itemTitle:NewAddSectionItemInfoTitle = NewAddSectionItemInfoTitle(title:build.title)
        
        let items:[NewAddSectionItemProtocol] = [
            itemTitle]
        
        return items
    }
}
