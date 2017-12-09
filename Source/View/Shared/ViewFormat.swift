import Foundation

struct ViewFormat
{
    //MARK: internal
    
    static func factoryFormatter(decimals:Int) -> NumberFormatter
    {
        let numberFormatter:NumberFormatter = NumberFormatter()
        numberFormatter.minimumIntegerDigits = ViewFormat.Constants.General.minIntegers
        numberFormatter.maximumFractionDigits = decimals
        
        return numberFormatter
    }
}
