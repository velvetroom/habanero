import Foundation

final class ControllerNewAddIngredient:Controller<ArchNewAddIngredient>
{
    init(
        build:Build,
        database:Database)
    {
        super.init()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: internal
    
    func transitionBack()
    {
        self.viewMain.viewBar.searchBar.resignFirstResponder()
        self.parentController?.pop(horizontal:ControllerTransition.Horizontal.right)
    }
}
