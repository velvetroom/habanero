import Foundation

struct Format
{
    //MARK: internal
    
    static func factoryFormatter(decimals:Int) -> NumberFormatter
    {
        let numberFormatter:NumberFormatter = NumberFormatter()
        numberFormatter.minimumIntegerDigits = Format.Constants.Numeric.minIntegers
        numberFormatter.maximumFractionDigits = decimals
        
        return numberFormatter
    }
}
