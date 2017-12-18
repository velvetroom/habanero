import UIKit

final class ControllerNewAdd:Controller<ArchNewAdd>
{
    init(
        build:Build,
        settings:Settings,
        database:Database)
    {
        super.init()
        
        self.model.database = database
        self.model.settings = settings
        self.model.build = build
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func viewDidAppear(_ animated:Bool)
    {
        super.viewDidAppear(animated)
        self.viewMain.viewList.isUserInteractionEnabled = false
        
        self.model.load
        { [weak self] in
            
            self?.updateSections()
        }
    }
    
    //MARK: internal
    
    func updateSections()
    {
        self.viewMain.viewList.isUserInteractionEnabled = true
        self.viewMain.viewList.collectionView.reloadData()
    }
    
    func transitionBack()
    {
        self.parentController?.pop(horizontal:ControllerTransition.Horizontal.right)
    }
}
