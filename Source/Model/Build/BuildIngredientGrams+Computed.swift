import Foundation

extension BuildIngredientGrams
{
    public override var rawIngredientAmountType:Int16
    {
        get
        {
            return IngredientAmountType.grams.rawValue
        }
        
        set(newValue) { }
    }
}
