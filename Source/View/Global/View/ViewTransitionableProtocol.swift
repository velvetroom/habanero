import UIKit

protocol ViewTransitionableProtocol:Any
{
    weak var layoutLeft:NSLayoutConstraint! { get set }
    weak var layoutRight:NSLayoutConstraint! { get set }
    weak var layoutTop:NSLayoutConstraint! { get set }
    weak var layoutBottom:NSLayoutConstraint! { get set }
    weak var pushBackground:ViewPushBackground? { get set }
    var shouldPanBack:Bool { get }
}
