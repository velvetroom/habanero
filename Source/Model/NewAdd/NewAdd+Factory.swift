import Foundation

extension NewAdd
{
    //MARK: private
    
    private class func factoryInfoSection() -> NewAddSection
    {
        let items:[NewAddSectionItemProtocol] = []
        
        let section:NewAddSection = NewAddSection(
            title:String.localizedModel(key:"NewAdd_infoSectionTitle"),
            headerHeight:NewAdd.Constants.headerInfoHeight,
            items:items)
        
        return section
    }
    
    private class func factoryIngredientsSection() -> NewAddSection
    {
        let items:[NewAddSectionItemProtocol] = []
        
        let section:NewAddSection = NewAddSection(
            title:String.localizedModel(key:"NewAdd_ingredientsSectionTitle"),
            headerHeight:NewAdd.Constants.headerIngredientsHeight,
            items:items)
        
        return section
    }
    
    private class func factoryStepsSection() -> NewAddSection
    {
        let items:[NewAddSectionItemProtocol] = []
        
        let section:NewAddSection = NewAddSection(
            title:String.localizedModel(key:"NewAdd_stepsSectionTitle"),
            headerHeight:NewAdd.Constants.headerStepsHeight,
            items:items)
        
        return section
    }
    
    //MARK: internal
    
    class func factorySections() -> [NewAddSection]
    {
        let infoSection:NewAddSection = NewAdd.factoryInfoSection()
        let ingredientsSection:NewAddSection = NewAdd.factoryIngredientsSection()
        let stepsSection:NewAddSection = NewAdd.factoryStepsSection()
        
        let sections:[NewAddSection] = [
            infoSection,
            ingredientsSection,
            stepsSection]
        
        return sections
    }
}
