import UIKit

final class ViewBar<A>:View<A> where A.C:Controller<A>
{
    weak var labelTitle:UILabel!
    
    required init(controller:A.C)
    {
        super.init(controller:controller)
        isUserInteractionEnabled = false
        backgroundColor = UIColor.white
        
        factoryViews()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
