import UIKit

struct NewAddSectionInfo:NewAddSectionProtocol
{
    let title:String
    let footerReusableIdentifier:String
    let headerHeight:CGFloat
    let footerHeight:CGFloat
    let items:[NewAddSectionItemProtocol]

    init(
        build:Build,
        settings:Settings)
    {
        self.title = String.localizedModel(key:"NewAdd_infoSectionTitle")
        self.footerReusableIdentifier = ViewNewAddListFooterInfo.reusableIdentifier
        self.headerHeight = NewAdd.Constants.headerInfoHeight
        self.footerHeight = NewAdd.Constants.footerInfoHeight
        
        self.items = NewAddSectionInfo.factoryItems(build:build)
    }
    
    //MARK: private
    
    private static func factoryItems(build:Build) -> [NewAddSectionItemProtocol]
    {
        let itemTitle:NewAddSectionItemInfoTitle = NewAddSectionItemInfoTitle(title:build.title)
        let itemDuration:NewAddSectionItemInfoDuration = NewAddSectionItemInfoDuration(duration:build.duration)
        
        let items:[NewAddSectionItemProtocol] = [
            itemTitle,
            itemDuration]
        
        return items
    }
}
