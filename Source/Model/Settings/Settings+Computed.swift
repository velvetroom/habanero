import Foundation

extension Settings
{
    var metrics:SettingsMetrics
    {
        get
        {
            guard
            
                let metrics:SettingsMetrics = SettingsMetrics(rawValue:self.rawMetrics)
            
            else
            {
                return SettingsMetrics.international
            }
            
            return metrics
        }
        
        set(newValue)
        {
            self.rawMetrics = newValue.rawValue
        }
    }
}
