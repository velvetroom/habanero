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
}
