import Foundation

extension NewAdd
{
    //MARK: internal
    
    class func factorySections(build:Build) -> [NewAddSectionProtocol]
    {
        let infoSection:NewAddSectionProtocol = NewAddSectionInfo(build:build)
        let ingredientsSection:NewAddSectionProtocol = NewAddSectionIngredients(build:build)
        let stepsSection:NewAddSectionProtocol = NewAddSectionSteps(build:build)
        
        let sections:[NewAddSectionProtocol] = [
            infoSection,
            ingredientsSection,
            stepsSection]
        
        return sections
    }
}
