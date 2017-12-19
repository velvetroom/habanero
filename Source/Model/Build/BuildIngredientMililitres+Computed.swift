import Foundation

extension BuildIngredientMililitres
{
    public override var rawIngredientAmountType:Int16
    {
        get
        {
            return IngredientAmountType.mililitres.rawValue
        }
        
        set(newValue) { }
    }
}
