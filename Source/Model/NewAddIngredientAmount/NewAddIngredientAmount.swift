import Foundation

final class NewAddIngredientAmount:Model<ArchNewAddIngredientAmount>
{
    var ingredient:Ingredient?
    var build:Build?
    var database:Database?
    var selectedType:NewAddIngredientAmountTypeProtocol?
    let types:[NewAddIngredientAmountTypeProtocol]
    
    var selectedIndex:IndexPath?
    {
        get
        {
            let indexPath:IndexPath? = self.currentIndexPath()
            
            return indexPath
        }
    }
    
    required init()
    {
        self.types = NewAddIngredientAmount.factoryTypes()
        
        super.init()
        
        self.selectedType = self.types.first
    }
    
    //MARK: private
    
    private func currentIndexPath() -> IndexPath?
    {
        guard
            
            let selectedType:NewAddIngredientAmountTypeProtocol = self.selectedType
            
        else
        {
            return nil
        }
        
        let typeOfSelected:NewAddIngredientAmountTypeProtocol.Type = type(of:selectedType)
        var item:Int = 0
        
        for indexedType:NewAddIngredientAmountTypeProtocol in self.types
        {
            let typeOfType:NewAddIngredientAmountTypeProtocol.Type = type(of:indexedType)
            
            guard
                
                typeOfSelected == typeOfType
                
            else
            {
                item += 1
                
                continue
            }
            
            let indexPath:IndexPath = IndexPath(
                item:item,
                section:0)
            
            return indexPath
        }
        
        return nil
    }
}
