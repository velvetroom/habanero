import Foundation

protocol FormatIngredientTypeProtocol
{
    static func factoryAmount(
        buildIngredient:BuildIngredient,
        settings:Settings) -> String?
    
    static func factoryAmount(
        recipeIngredient:RecipeIngredient,
        settings:Settings) -> String?
}
