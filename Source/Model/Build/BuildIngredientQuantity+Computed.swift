import Foundation

extension BuildIngredientQuantity
{
    public override var rawIngredientType:Int16
    {
        get
        {
            return IngredientType.quantity.rawValue
        }
        
        set(newValue) { }
    }
}
