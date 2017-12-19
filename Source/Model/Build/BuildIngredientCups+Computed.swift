import Foundation

extension BuildIngredientCups
{
    public override var rawIngredientType:Int16
    {
        get
        {
            return IngredientAmountType.cups.rawValue
        }
        
        set(newValue) { }
    }
}
