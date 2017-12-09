import Foundation

extension ViewFormat
{
    //MARK: private
    
    private static func factoryMinutes(duration:TimeInterval) -> String?
    {
        let number:NSNumber = duration as NSNumber
        let numberFormatter:NumberFormatter = ViewFormat.factoryFormatter(decimals:0)
        
        let minutesString:String? = numberFormatter.string(from:number)
        
        return minutesString
    }
    
    private static func factoryHours(duration:TimeInterval) -> String?
    {
        let hours:TimeInterval = duration / ViewFormat.Constants.Duration.minutesPerHour
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
        
        if duration > ViewFormat.Constants.Duration.minutesPerHour
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
