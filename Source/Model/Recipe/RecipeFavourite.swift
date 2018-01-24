import Foundation

extension RecipeFavourite
{
    public override func awakeFromInsert()
    {
        super.awakeFromInsert()
        
        self.created = Date()
    }
}
