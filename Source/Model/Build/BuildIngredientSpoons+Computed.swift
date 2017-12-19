import Foundation

extension BuildIngredientSpoons
{
    public override var rawIngredientType:Int16
    {
        get
        {
            return IngredientAmountType.spoons.rawValue
        }
        
        set(newValue) { }
    }
}
