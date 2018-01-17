import UIKit

final class ControllerCookStep:Controller<ArchCookStep>
{
    init(item:HomeItem)
    {
        super.init()
        
        self.model.homeItem = item
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: internal
    
    func transitionClose()
    {
        self.parentController?.pop(vertical:ControllerTransition.Vertical.bottom)
    }
    
    func loadStepImage(
        item:CookStepItemImage,
        cell:ViewCookStepListCellImage)
    {
        self.model.loadStepImage(item:item)
        { (image:UIImage) in
            
            item.image = image
            
            guard
            
                cell.item === item
            
            else
            {
                return
            }
            
            cell.imageView.image = image
        }
    }
}
