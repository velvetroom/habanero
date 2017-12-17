import Foundation

extension BuildIngredientMililitres
{
    public override var rawIngredientType:Int16
    {
        get
        {
            return IngredientType.mililitres.rawValue
        }
        
        set(newValue) { }
    }
}
