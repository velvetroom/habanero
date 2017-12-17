import Foundation

struct FormatIngredientTypeGrams:FormatIngredientTypeProtocol
{
    //MARK: internal
    
    static func factoryAmount(
        buildIngredient:BuildIngredient,
        settings:Settings) -> String?
    {
        return nil
    }
}
