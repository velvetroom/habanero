import UIKit

struct NewAddSectionItemInfoDuration:NewAddSectionItemProtocol
{
    let reusableIdentifier:String = ViewNewAddListCellInfoDuration.reusableIdentifier
    let cellHeight:CGFloat = NewAdd.Constants.cellDurationTitleHeight
    let minuteSelected:Int
    let minutes:[TimeInterval]
    
    init(duration:TimeInterval)
    {
        self.minutes = NewAddSectionItemInfoDuration.factoryMinutes()
        
        self.minuteSelected = NewAddSectionItemInfoDuration.factoryMinuteSelected(
            duration:duration,
            minutes:self.minutes)
    }
    
    //MARK: private
    
    private static func factoryMinutes() -> [TimeInterval]
    {
        guard
            
            let minutesURL:URL = Bundle.main.url(
                forResource:NewAddSectionItemInfoDuration.Constants.minutesFile,
                withExtension:nil),
            let minutesArray:NSArray = NSArray(
                contentsOf:minutesURL),
            let minutes:[TimeInterval] = minutesArray as? [TimeInterval]
            
        else
        {
            return []
        }
        
        return minutes
    }
    
    private static func factoryMinuteSelected(
        duration:TimeInterval,
        minutes:[TimeInterval]) -> Int
    {
        let minute:TimeInterval = duration / ViewFormat.Constants.Duration.secondsPerMinute
        var selected:Int = 0
        
        for indexedMinute:TimeInterval in minutes
        {
            guard
            
                indexedMinute >= minute
            
            else
            {
                selected += 1
                
                continue
            }
            
            break
        }
        
        return selected
    }
}
