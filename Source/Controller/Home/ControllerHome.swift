import Foundation

final class ControllerHome:Controller<ArchHome>
{
    override func viewDidAppear(_ animated:Bool)
    {
        super.viewDidAppear(animated)
        
        self.viewMain.superview?.isUserInteractionEnabled = false
        self.viewMain.viewList.isHidden = true
        self.viewMain.viewSpinner.startAnimating()
        
        self.model.loadSettings
        { [weak self] in
            
            self?.loadRecipes()
        }
    }
    
    //MARK: private
    
    private func loadRecipes()
    {
        self.model.loadRecipes
        { [weak self] in
        
            self?.modelReady()
        }
    }
    
    private func modelReady()
    {
        self.viewMain.superview?.isUserInteractionEnabled = true
        self.viewMain.viewList.isHidden = false
        self.viewMain.viewSpinner.stopAnimating()
    }
}
