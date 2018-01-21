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
        
        item.loadImage(storage:self.model.storage)
        { (image:UIImage) in
            
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
        
        item.loadIngredients(cloud:self.model.cloud)
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
