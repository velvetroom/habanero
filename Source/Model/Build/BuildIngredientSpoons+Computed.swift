import Foundation

extension BuildIngredientSpoons
{
    public override var rawIngredientAmountType:Int16
    {
        get
        {
            return IngredientAmountType.spoons.rawValue
        }
        
        set(newValue) { }
    }
}
