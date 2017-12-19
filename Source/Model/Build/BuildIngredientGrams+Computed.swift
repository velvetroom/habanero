import Foundation

extension BuildIngredientGrams
{
    public override var rawIngredientType:Int16
    {
        get
        {
            return IngredientAmountType.grams.rawValue
        }
        
        set(newValue) { }
    }
}
