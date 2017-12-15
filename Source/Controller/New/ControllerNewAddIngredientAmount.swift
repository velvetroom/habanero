import Foundation

final class ControllerNewAddIngredientAmount:Controller<ArchNewAddIngredientAmount>
{
    init(
        ingredient:Ingredient,
        build:Build,
        database:Database)
    {
        super.init()
        
        self.model.ingredient = ingredient
        self.model.build = build
        self.model.database = database
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func viewDidAppear(_ animated:Bool)
    {
        super.viewDidAppear(animated)
        
        let selectedIndex:IndexPath? = self.model.selectedIndex
        
        self.viewMain.viewInput.textField.becomeFirstResponder()
        self.viewMain.viewList.selectIndex(index:selectedIndex)
    }
    
    //MARK: internal
    
    func transitionBack()
    {
        self.viewMain.viewInput.textField.resignFirstResponder()
        self.parentController?.pop(horizontal:ControllerTransition.Horizontal.right)
    }
    
    func selectType(item:NewAddIngredientAmountTypeProtocol)
    {
        self.model.selectedType = item
    }
    
    func createIngredient()
    {
        guard
            
            let amount:String = self.viewMain.viewInput.textField.text
        
        else
        {
            return
        }
        
        self.viewMain.viewInput.textField.resignFirstResponder()
        self.viewMain.viewInput.isUserInteractionEnabled = false
        self.viewMain.viewList.isUserInteractionEnabled = false
        
        
    }
}
