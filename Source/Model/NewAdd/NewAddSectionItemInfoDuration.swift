import UIKit

struct NewAddSectionItemInfoDuration:NewAddSectionItemProtocol
{
    let reusableIdentifier:String = ViewNewAddListCellInfoDuration.reusableIdentifier
    let cellHeight:CGFloat = NewAdd.Constants.cellDurationTitleHeight
    let duration:TimeInterval
    let minutes:[TimeInterval]
    
    init(duration:TimeInterval)
    {
        self.duration = duration
        self.minutes = NewAddSectionItemInfoDuration.factoryMinutes()
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
}
