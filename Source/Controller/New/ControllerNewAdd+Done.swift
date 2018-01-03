import Foundation

extension ControllerNewAdd
{
    //MARK: private
    
    private func foundError(error:Error)
    {
        ViewAlert.messageFail(message:error.localizedDescription)
        
        self.viewMain.isUserInteractionEnabled = true
        self.viewMain.viewList.isHidden = false
        self.viewMain.viewSpinner.stopAnimating()
    }
    
    private func passedValidation()
    {
        self.viewMain.viewList.isHidden = true
        self.viewMain.viewSpinner.startAnimating()
        
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
        self.viewMain.isUserInteractionEnabled = false
        
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
