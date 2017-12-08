import UIKit

final class ControllerNewAdd:Controller<ArchNewAdd>
{
    //MARK: private
    
    private func deleteConfirmed()
    {
        self.transitionBack()
    }
    
    //MARK: internal
    
    func transitionBack()
    {
        self.parentController?.pop(horizontal:ControllerTransition.Horizontal.right)
    }
    
    func alertConfirmDelete()
    {
        let alert:UIAlertController = UIAlertController(
            title:String.localizedController(key:"ControllerNewAdd_alertDeleteTitle"),
            message:nil,
            preferredStyle:UIAlertControllerStyle.actionSheet)
        
        let actionCancel:UIAlertAction = UIAlertAction(
            title:String.localizedController(key:"ControllerNewAdd_alertDeleteCancel"),
            style:UIAlertActionStyle.cancel)
        
        let actionDelete:UIAlertAction = UIAlertAction(
            title:String.localizedController(key:"ControllerNewAdd_alertDeleteDelete"),
            style:UIAlertActionStyle.destructive)
        { [weak self] (action:UIAlertAction) in
            
            self?.deleteConfirmed()
        }
        
        alert.addAction(actionDelete)
        alert.addAction(actionCancel)
        
        if let popover:UIPopoverPresentationController = alert.popoverPresentationController
        {
            popover.sourceView = self.view
            popover.permittedArrowDirections = UIPopoverArrowDirection.up
            popover.sourceRect = CGRect(
                x:self.view.center.x,
                y:0,
                width:1,
                height:1)
        }
        
        self.present(
            alert,
            animated:true,
            completion:nil)
    }
}
