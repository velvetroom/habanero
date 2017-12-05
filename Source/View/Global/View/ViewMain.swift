import UIKit

class ViewMain<A>:View<A>, ViewTransitionableProtocol where A.C:Controller<A>
{
    private(set) var shouldPanBack:Bool = false
    weak var layoutLeft:NSLayoutConstraint!
    weak var layoutRight:NSLayoutConstraint!
    weak var layoutTop:NSLayoutConstraint!
    weak var layoutBottom:NSLayoutConstraint!
    weak var pushBackground:ViewPushBackground?
    
    required init(controller:A.C)
    {
        super.init(controller:controller)
        backgroundColor = UIColor.white
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
