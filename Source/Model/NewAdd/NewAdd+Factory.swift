import Foundation

extension NewAdd
{
    //MARK: internal
    
    class func factorySections(build:Build) -> [NewAddSectionProtocol]
    {
        let infoSection:NewAddSectionInfo = NewAddSectionInfo(build:build)
        let ingredientsSection:NewAddSectionIngredients = NewAddSectionIngredients(build:build)
        let stepsSection:NewAddSectionSteps = NewAddSectionSteps(build:build)
        
        let sections:[NewAddSectionProtocol] = [
            infoSection,
            ingredientsSection,
            stepsSection]
        
        return sections
    }
}
