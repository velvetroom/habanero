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
        let actionCancel:UIAlertAction = UIAlertAction(
            title:String.localizedController(key:"ControllerNewAdd_alertDeleteBuildCancel"),
            style:UIAlertActionStyle.cancel)
        
        let actionDelete:UIAlertAction = UIAlertAction(
            title:String.localizedController(key:"ControllerNewAdd_alertDeleteBuildDelete"),
            style:UIAlertActionStyle.destructive)
        { [weak self] (action:UIAlertAction) in
            
            self?.deleteConfirmed()
        }
        
        let actions:[UIAlertAction] = [
            actionDelete,
            actionCancel]
        
        self.showAlert(
            actions:actions,
            title:String.localizedController(key:"ControllerNewAdd_alertDeleteBuildTitle"))
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
