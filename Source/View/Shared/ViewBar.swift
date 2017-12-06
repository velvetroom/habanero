import UIKit

class ViewBar<A>:View<A> where A.C:Controller<A>
{
    weak var labelTitle:UILabel!
    
    required init(controller:A.C)
    {
        super.init(controller:controller)
        self.isUserInteractionEnabled = false
        self.backgroundColor = UIColor.white
        
        self.factoryViews()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
