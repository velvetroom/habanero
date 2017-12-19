import UIKit

struct NewAddSectionSteps:NewAddSectionProtocol
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
        self.title = String.localizedModel(key:"NewAdd_stepsSectionTitle")
        self.footerReusableIdentifier = ViewNewAddListFooterSteps.reusableIdentifier
        self.headerHeight = NewAdd.Constants.headerStepsHeight
        self.footerHeight = NewAdd.Constants.footerStepsHeight
        
        self.items = []
    }
}
