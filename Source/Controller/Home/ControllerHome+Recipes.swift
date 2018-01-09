import UIKit

extension ControllerHome
{
    //MARK: private
    
    private func updateImage(
        item:HomeItem,
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
    
    //MARK: internal
    
    func loadRecipeImage(
        item:HomeItem,
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
        
        self.model.loadRecipeImage(recipe:item.recipe)
        { (image:UIImage) in
            
            item.image = image
            
            self.updateImage(
                item:item,
                on:cell)
        }
    }
}
