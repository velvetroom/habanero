import UIKit

extension ControllerOptions
{
    //MARK: internal
    
    func configureMetrics(viewMetrics:ViewOptionsListCellMetrics)
    {
        self.model.loadSettings
        { (settings:Settings) in
            
            let metricIndex:Int = Int(settings.metrics.rawValue)
            viewMetrics.viewSegmented.selectedSegmentIndex = metricIndex
        }
    }
    
    func updateMetrics(viewMetrics:ViewOptionsListCellMetrics)
    {
        let metricsIndex:Int16 = Int16(viewMetrics.viewSegmented.selectedSegmentIndex)
        
        guard
            
            let metrics:SettingsMetrics = SettingsMetrics(rawValue:metricsIndex)
            
        else
        {
            return
        }
        
        self.model.loadSettings
        { [weak self] (settings:Settings) in
            
            settings.metrics = metrics
            
            self?.model.settingsUpdated()
        }
    }
}
