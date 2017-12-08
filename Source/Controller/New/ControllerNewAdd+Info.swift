import UIKit

extension ControllerNewAdd
{
    //MARK: private
    
    private func deleteConfirmed()
    {
        self.transitionBack()
    }
    
    //MARK: internal
    
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
    
    func editInfoTitle()
    {
        guard
            
            let title:String = self.model.build?.title
        
        else
        {
            return
        }
        
        let controller:ControllerText = ControllerText(text:title)
        { [weak self] (text:String) in
            
            self?.model.editTitle(title:text)
        }
        
        self.parentController?.push(
            controller:controller,
            vertical:ControllerTransition.Vertical.bottom)
    }
}
