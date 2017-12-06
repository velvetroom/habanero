import UIKit

final class ViewBar<A>:View<A> where A.C:Controller<A>
{
    required init(controller:A.C)
    {
        super.init(controller:controller)
        isUserInteractionEnabled = false
        backgroundColor = UIColor.white
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
