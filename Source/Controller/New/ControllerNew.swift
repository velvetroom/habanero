import Foundation

final class ControllerNew:Controller<ArchNew>
{
    override func viewDidAppear(_ animated:Bool)
    {
        super.viewDidAppear(animated)
        
        self.model.load
        { [weak self] in
            
            self?.updateBuilds()
        }
    }
    
    //MARK: private
    
    private func updateBuilds()
    {
        self.viewMain.viewList.collectionView.reloadData()
    }
    
    //MARK: internal
    
    func transitionToNewAdd(build:Build)
    {
        guard
            
            let settings:Settings = self.model.settings
        
        else
        {
            return
        }
        
        let controller:ControllerNewAdd = ControllerNewAdd(
            build:build,
            settings:settings)
        
        self.parentController?.push(
            controller:controller,
            horizontal:ControllerTransition.Horizontal.right)
    }
    
    func createBuildAndTransitionToNewAdd()
    {
        self.model.createBuild
        { [weak self] (build:Build) in
            
            self?.transitionToNewAdd(build:build)
        }
    }
}
