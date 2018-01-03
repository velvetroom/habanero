import Foundation

enum NewAddError:Error
{
    case invalidImageData
    case validateErrorMinSteps
    case validateErrorMinIngredients
    case validateErrorTitle
    case validateErrorSubtitle
    case validateErrorImage
}
