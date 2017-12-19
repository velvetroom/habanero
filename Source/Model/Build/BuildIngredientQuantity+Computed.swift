import Foundation

extension BuildIngredientQuantity
{
    public override var rawIngredientAmountType:Int16
    {
        get
        {
            return IngredientAmountType.quantity.rawValue
        }
        
        set(newValue) { }
    }
}
