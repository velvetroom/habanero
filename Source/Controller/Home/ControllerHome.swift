import Foundation

final class ControllerHome:Controller<ArchHome>
{
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.view.superview?.isUserInteractionEnabled = false
        
        self.model.loadSettings
        { [weak self] in
        
            self?.settingsLoaded()
        }
    }
    
    //MARK: private
    
    private func settingsLoaded()
    {
        
    }
}
