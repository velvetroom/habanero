import Foundation

extension BuildIngredientGrams
{
    public override var rawIngredientType:Int16
    {
        get
        {
            return IngredientType.grams.rawValue
        }
        
        set(newValue) { }
    }
}
