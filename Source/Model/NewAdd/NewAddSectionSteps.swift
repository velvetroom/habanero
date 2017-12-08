import UIKit

struct NewAddSectionSteps:NewAddSectionProtocol
{
    let title:String
    let footerReusableIdentifier:String
    let headerHeight:CGFloat
    let items:[NewAddSectionItemProtocol]
    
    init()
    {
        self.title = String.localizedModel(key:"NewAdd_stepsSectionTitle")
        self.footerReusableIdentifier = ViewNewAddListFooterSteps.reusableIdentifier
        self.headerHeight = NewAdd.Constants.headerStepsHeight
        self.items = []
    }
}
