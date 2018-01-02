import UIKit

struct NewAddSectionInfo:NewAddSectionProtocol
{
    var items:[NewAddSectionItemProtocol]
    let title:String
    let footerReusableIdentifier:String
    let headerHeight:CGFloat
    let footerHeight:CGFloat

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
        var items:[NewAddSectionItemProtocol] = []
        
        let image:UIImage? = NewAddSectionInfo.factoryBuildImage(build:build)
        let itemImage:NewAddSectionItemInfoImage = NewAddSectionItemInfoImage(image:image)
        items.append(itemImage)
        
        if let title:String = build.title
        {
            let itemTitle:NewAddSectionItemInfoTitle = NewAddSectionItemInfoTitle(title:title)
            
            items.append(itemTitle)
        }
        
        if let subtitle:String = build.subtitle
        {
            let itemSubtitle:NewAddSectionItemInfoSubtitle = NewAddSectionItemInfoSubtitle(subtitle:subtitle)
            
            items.append(itemSubtitle)
        }
        
        let itemDuration:NewAddSectionItemInfoDuration = NewAddSectionItemInfoDuration(duration:build.duration)
        items.append(itemDuration)
        
        return items
    }
    
    private static func factoryBuildImage(build:Build) -> UIImage?
    {
        guard
        
            let imageIdentifier:String = build.imageIdentifier
        
        else
        {
            return nil
        }
        
        let image:UIImage? = NewAdd.localImageForIdentifier(identifier:imageIdentifier)
        
        return image
    }
}
