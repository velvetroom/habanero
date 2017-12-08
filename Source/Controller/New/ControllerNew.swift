import Foundation

final class ControllerNew:Controller<ArchNew>
{
    //MARK: internal
    
    func transitionToNewAdd(build:Build)
    {
        guard
            
            let database:Database = self.model.database
        
        else
        {
            return
        }
        
        let controller:ControllerNewAdd = ControllerNewAdd(
            build:build,
            database:database)
        
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
