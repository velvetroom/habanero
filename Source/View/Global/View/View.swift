import UIKit

class View<A>:UIView, ViewControllableProtocol where A.C:Controller<A>
{
    typealias C = A.C
    private(set) weak var controller:C!
    
    required init(controller:C)
    {
        super.init(frame:CGRect.zero)
        self.clipsToBounds = true
        self.backgroundColor = UIColor.clear
        self.translatesAutoresizingMaskIntoConstraints = false
        self.controller = controller
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
