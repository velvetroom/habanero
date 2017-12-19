import Foundation

extension BuildIngredientQuantity
{
    public override var rawIngredientType:Int16
    {
        get
        {
            return IngredientAmountType.quantity.rawValue
        }
        
        set(newValue) { }
    }
}
