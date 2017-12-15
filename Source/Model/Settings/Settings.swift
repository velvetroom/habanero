import Foundation

extension Settings
{
    public override func awakeFromInsert()
    {
        super.awakeFromInsert()
        
        self.metrics = SettingsMetrics.international
    }
}
