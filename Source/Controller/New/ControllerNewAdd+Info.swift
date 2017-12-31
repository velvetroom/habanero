import UIKit

extension ControllerNewAdd
{
    //MARK: private
    
    private func deleteConfirmed()
    {
        self.model.delete
        { [weak self] in
            
            self?.transitionBack()
        }
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
            
            self?.model.editInfoTitle(title:text)
            { [weak self] in
                
                self?.loadModel()
            }
        }
        
        self.parentController?.push(
            controller:controller,
            vertical:ControllerTransition.Vertical.bottom)
    }
    
    func editInfoSubtitle()
    {
        let subtitle:String
        
        if let currentSubtitle:String = self.model.build?.subtitle
        {
            subtitle = currentSubtitle
        }
        else
        {
            subtitle = String()
        }
        
        let controller:ControllerText = ControllerText(text:subtitle)
        { [weak self] (text:String) in
            
            guard
                
                text.count > 0
            
            else
            {
                return
            }
            
            self?.model.editInfoSubtitle(subtitle:text)
            { [weak self] in
                
                self?.loadModel()
            }
        }
        
        self.parentController?.push(
            controller:controller,
            vertical:ControllerTransition.Vertical.bottom)
    }
    
    func durationEdited(duration:TimeInterval)
    {
        self.model.durationEdited(duration:duration)
    }
    
    func updateInfoImage()
    {
        let controller:ControllerPhoto = ControllerPhoto
        { [weak self] (image:UIImage?) in
            
            guard
                
                let image:UIImage = image
                
            else
            {
                return
            }
            
            self?.model.updateInfoImage(image:image)
            { [weak self] in
                
                self?.loadModel()
            }
        }
        
        self.parentController?.animateOver(controller:controller)
    }
}
