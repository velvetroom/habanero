import Foundation

struct HomeFilter
{
    var show:HomeFilterShowProtocol
    var order:HomeFilterOrderProtocol
    var keywords:String
    
    init(
        show:HomeFilterShowProtocol,
        order:HomeFilterOrderProtocol)
    {
        self.show = show
        self.order = order
        self.keywords = String()
    }
}
