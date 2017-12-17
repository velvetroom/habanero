import Foundation

extension BuildIngredientCups
{
    public override var suffix:String?
    {
        get
        {
            return String.localizedModel(key:"BuildIngredientCups_suffix")
        }
    }
    
    public override var decimals:Int16
    {
        get
        {
            return BuildIngredientCups.Constants.maxDecimals
        }
    }
}
