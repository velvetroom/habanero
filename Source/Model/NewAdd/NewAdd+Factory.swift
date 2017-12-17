import Foundation

extension NewAdd
{
    //MARK: internal
    
    class func factorySections(
        build:Build,
        settings:Settings) -> [NewAddSectionProtocol]
    {
        let infoSection:NewAddSectionInfo = NewAddSectionInfo(
            build:build,
            settings:settings)
        
        let ingredientsSection:NewAddSectionIngredients = NewAddSectionIngredients(
            build:build,
            settings:settings)
        
        let stepsSection:NewAddSectionSteps = NewAddSectionSteps(
            build:build,
            settings:settings)
        
        let sections:[NewAddSectionProtocol] = [
            infoSection,
            ingredientsSection,
            stepsSection]
        
        return sections
    }
}
