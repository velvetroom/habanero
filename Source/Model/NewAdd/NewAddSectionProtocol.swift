import UIKit

protocol NewAddSectionProtocol
{
    var title:String { get }
    var footerReusableIdentifier:String  { get }
    var headerHeight:CGFloat  { get }
    var items:[NewAddSectionItemProtocol]  { get }
    
    init(build:Build)
}
