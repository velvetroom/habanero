import Foundation

protocol FormatIngredientTypeProtocol
{
    static func factoryAmount(
        buildIngredient:BuildIngredient,
        settings:Settings) -> String?
}
