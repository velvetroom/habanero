import Foundation

extension ControllerNewAdd
{
    //MARK: private
    
    private func foundError(error:Error)
    {
        ViewAlert.messageFail(message:error.localizedDescription)
        
        self.viewMain.viewList.isUserInteractionEnabled = true
    }
    
    private func passedValidation()
    {
        self.model.save
        { [weak self] (error:Error?) in
            
            guard
                
                let error:Error = error
                
            else
            {
                self?.deleteConfirmed()
                
                return
            }
            
            self?.foundError(error:error)
        }
    }
    
    //MARK: internal
    
    func createRecipe()
    {
        self.viewMain.viewList.isUserInteractionEnabled = false
        
        self.model.validate
        { [weak self] (error:Error?) in
            
            guard
            
                let error:Error = error
            
            else
            {
                self?.passedValidation()
                
                return
            }
            
            self?.foundError(error:error)
        }
    }
}
