import Foundation

final class ControllerHome:Controller<ArchHome>
{
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.viewMain.superview?.isUserInteractionEnabled = false
    }
    
    override func viewDidAppear(_ animated:Bool)
    {
        super.viewDidAppear(animated)
        
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
        self.viewMain.viewSpinner.stopAnimating()
        self.viewMain.viewList.isHidden = false
        self.viewMain.viewList.collectionView.reloadData()
        self.viewMain.superview?.isUserInteractionEnabled = true
    }
    
    //MARK: internal
    
    func transitionToRecipe(item:HomeItem)
    {
        let controller:ControllerCook = ControllerCook(item:item)
        
        self.parentController?.push(
            controller:controller,
            horizontal:ControllerTransition.Horizontal.right)
    }
}
