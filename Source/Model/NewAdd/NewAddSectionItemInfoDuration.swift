import UIKit

struct NewAddSectionItemInfoDuration:NewAddSectionItemProtocol
{
    let reusableIdentifier:String = ViewNewAddListCellInfoDuration.reusableIdentifier
    let cellHeight:CGFloat = NewAdd.Constants.cellInfoDurationHeight
    let minutes:[TimeInterval]
    private(set) var minuteSelected:Int
    
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
            var minutes:[TimeInterval] = minutesArray as? [TimeInterval]
            
        else
        {
            return []
        }
        
        minutes.sort
        { (minuteA:TimeInterval, minuteB:TimeInterval) -> Bool in
            
            return minuteA < minuteB
        }
        
        return minutes
    }
    
    private static func factoryMinuteSelected(
        duration:TimeInterval,
        minutes:[TimeInterval]) -> Int
    {
        let minute:TimeInterval = duration / Format.Constants.Duration.secondsPerMinute
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
    
    //MARK: internal
    
    mutating func updateDuration(duration:TimeInterval)
    {
        self.minuteSelected = NewAddSectionItemInfoDuration.factoryMinuteSelected(
            duration:duration,
            minutes:self.minutes)
    }
}
