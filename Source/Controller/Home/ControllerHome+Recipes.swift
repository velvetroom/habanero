import UIKit

extension ControllerHome
{
    //MARK: private
    
    private func updateImage(
        item:CookItem,
        on cell:ViewHomeListCell)
    {
        guard
        
            item === cell.model
        
        else
        {
            return
        }
        
        cell.imageView.image = item.image
    }
    
    private func loadRecipeImage(
        item:CookItem,
        on cell:ViewHomeListCell)
    {
        guard
            
            item.image == nil
        
        else
        {
            self.updateImage(
                item:item,
                on:cell)
            
            return
        }
        
        cell.imageView.image = nil
        
        self.model.loadRecipeImage(recipe:item.recipe)
        { (image:UIImage) in
            
            item.image = image
            
            self.updateImage(
                item:item,
                on:cell)
        }
    }
    
    private func loadRecipeIngredients(item:CookItem)
    {
        guard
        
            item.ingredients.count == 0
        
        else
        {
            return
        }
        
        self.model.loadIngredientsFor(item:item)
    }
    
    private func loadRecipeSteps(item:CookItem)
    {
        guard
        
            item.steps.count == 0
        
        else
        {
            return
        }
        
        self.model.loadStepsFor(item:item)
    }
    
    //MARK: internal
    
    func loadRecipeContents(
        item:CookItem,
        on cell:ViewHomeListCell)
    {
        self.loadRecipeImage(
            item:item,
            on:cell)
        
        self.loadRecipeIngredients(item:item)
        self.loadRecipeSteps(item:item)
    }
}
