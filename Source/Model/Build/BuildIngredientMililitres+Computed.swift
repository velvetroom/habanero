import Foundation

extension BuildIngredientMililitres
{
    public override var rawIngredientType:Int16
    {
        get
        {
            return IngredientAmountType.mililitres.rawValue
        }
        
        set(newValue) { }
    }
}
