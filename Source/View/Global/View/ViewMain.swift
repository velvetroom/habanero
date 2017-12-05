import UIKit

class ViewMain:UIView, ViewTransitionableProtocol
{
    private(set) weak var controller:UIViewController!
    private(set) var shouldPanBack:Bool = false
    weak var layoutLeft:NSLayoutConstraint!
    weak var layoutRight:NSLayoutConstraint!
    weak var layoutTop:NSLayoutConstraint!
    weak var layoutBottom:NSLayoutConstraint!
    weak var pushBackground:ViewPushBackground?
    
    required init(controller:UIViewController)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.white
        translatesAutoresizingMaskIntoConstraints = false
        self.controller = controller
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
