import Foundation

extension Build
{
    public override func awakeFromInsert()
    {
        let timestamp:Date = Date()
        
        self.created = timestamp
        self.syncstamp = timestamp
        self.duration = Build.Constants.defaultDuration
        self.title = String()
    }
}
