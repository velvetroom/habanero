import Foundation

extension ViewFormat
{
    //MARK: private
    
    private static func factoryMinutes(duration:TimeInterval) -> String?
    {
        let minutes:TimeInterval = duration / ViewFormat.Constants.Duration.secondsPerMinute
        let number:NSNumber = minutes as NSNumber
        let numberFormatter:NumberFormatter = ViewFormat.factoryFormatter(decimals:0)
        
        let minutesString:String? = numberFormatter.string(from:number)
        
        return minutesString
    }
    
    private static func factoryHours(duration:TimeInterval) -> String?
    {
        let hours:TimeInterval = duration / ViewFormat.Constants.Duration.secondsPerHour
        let number:NSNumber = hours as NSNumber
        let numberFormatter:NumberFormatter = ViewFormat.factoryFormatter(
            decimals:ViewFormat.Constants.Duration.decimalsPerHour)
        
        let hoursString:String? = numberFormatter.string(from:number)
        
        return hoursString
    }
    
    //MARK: internal
    
    static func factoryDuration(duration:TimeInterval) -> String?
    {
        let durationString:String?
        
        if duration > ViewFormat.Constants.Duration.secondsPerHour
        {
            durationString = ViewFormat.factoryHours(duration:duration)
        }
        else
        {
            durationString = ViewFormat.factoryMinutes(duration:duration)
        }
        
        return durationString
    }
}
