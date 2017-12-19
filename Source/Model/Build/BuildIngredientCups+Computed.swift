import Foundation

extension BuildIngredientCups
{
    public override var rawIngredientAmountType:Int16
    {
        get
        {
            return IngredientAmountType.cups.rawValue
        }
        
        set(newValue) { }
    }
}
