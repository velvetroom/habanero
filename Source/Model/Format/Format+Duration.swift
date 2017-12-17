import Foundation

extension Format
{
    //MARK: private
    
    private static func factoryMinutes(duration:TimeInterval) -> String?
    {
        let minutes:TimeInterval = duration / Format.Constants.Duration.secondsPerMinute
        let number:NSNumber = minutes as NSNumber
        let numberFormatter:NumberFormatter = Format.factoryFormatter(decimals:0)
        numberFormatter.positiveSuffix = String.localizedView(key:"ViewFormat_durationMinutes")
        
        let minutesString:String? = numberFormatter.string(from:number)
        
        return minutesString
    }
    
    private static func factoryHours(duration:TimeInterval) -> String?
    {
        let hours:TimeInterval = duration / Format.Constants.Duration.secondsPerHour
        let number:NSNumber = hours as NSNumber
        let numberFormatter:NumberFormatter = Format.factoryFormatter(
            decimals:ViewFormat.Constants.Duration.decimalsPerHour)
        numberFormatter.positiveSuffix = String.localizedView(key:"ViewFormat_durationHours")
        
        let hoursString:String? = numberFormatter.string(from:number)
        
        return hoursString
    }
    
    //MARK: internal
    
    static func factoryDuration(duration:TimeInterval) -> String?
    {
        let durationString:String?
        
        if duration > Format.Constants.Duration.secondsPerHour
        {
            durationString = Format.factoryHours(duration:duration)
        }
        else
        {
            durationString = Format.factoryMinutes(duration:duration)
        }
        
        return durationString
    }
}
