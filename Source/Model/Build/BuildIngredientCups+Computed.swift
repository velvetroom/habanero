import Foundation

extension BuildIngredientCups
{
    public override var rawIngredientType:Int16
    {
        get
        {
            return IngredientType.cups.rawValue
        }
        
        set(newValue) { }
    }
}
