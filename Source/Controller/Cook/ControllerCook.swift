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
        item:CookItem,
        settings:Settings)
    {
        super.init()
     
        self.model.settings = settings
        self.model.cookItem = item
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    deinit
    {
        self.model.cookItem?.onImageUpdated = nil
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        guard
            
            self.model.cookItem?.image == nil
        
        else
        {
            return
        }
        
        self.model.cookItem?.onImageUpdated =
        { [weak self] (cookItem:CookItem) in
            
            self?.viewMain.viewHeader.imageView.image = cookItem.image
        }
    }
    
    //MARK: internal
    
    func transitionBack()
    {
        self.parentController?.pop(horizontal:ControllerTransition.Horizontal.right)
    }
    
    func transitionPlay()
    {
        guard
        
            let item:CookItem = self.model.cookItem
        
        else
        {
            return
        }
        
        let controller:ControllerCookStep = ControllerCookStep(item:item)
        
        self.parentController?.push(
            controller:controller,
            vertical:ControllerTransition.Vertical.bottom)
    }
}
