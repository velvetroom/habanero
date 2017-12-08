import Foundation

extension NewAdd
{
    //MARK: internal
    
    class func factorySections() -> [NewAddSectionProtocol]
    {
        let infoSection:NewAddSectionProtocol = NewAddSectionInfo()
        let ingredientsSection:NewAddSectionProtocol = NewAddSectionIngredients()
        let stepsSection:NewAddSectionProtocol = NewAddSectionSteps()
        
        let sections:[NewAddSectionProtocol] = [
            infoSection,
            ingredientsSection,
            stepsSection]
        
        return sections
    }
}
