import UIKit

final class ControllerCook:Controller<ArchCook>
{
    override var preferredStatusBarStyle:UIStatusBarStyle
    {
        get
        {
            return UIStatusBarStyle.lightContent
        }
    }
    
    init(
        item:HomeItem,
        settings:Settings)
    {
        super.init()
     
        self.model.settings = settings
        self.model.homeItem = item
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    deinit
    {
        self.model.homeItem?.onImageUpdated = nil
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        guard
            
            self.model.homeItem?.image == nil
        
        else
        {
            return
        }
        
        self.model.homeItem?.onImageUpdated =
        { [weak self] (homeItem:HomeItem) in
            
            self?.viewMain.viewHeader.imageView.image = homeItem.image
        }
    }
    
    //MARK: internal
    
    func transitionBack()
    {
        self.parentController?.pop(horizontal:ControllerTransition.Horizontal.right)
    }
    
    func transitionPlay()
    {
        
    }
}
