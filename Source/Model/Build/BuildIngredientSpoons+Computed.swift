import Foundation

extension BuildIngredientSpoons
{
    public override var rawIngredientType:Int16
    {
        get
        {
            return IngredientType.spoons.rawValue
        }
        
        set(newValue) { }
    }
}
