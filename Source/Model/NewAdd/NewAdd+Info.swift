import Foundation

extension NewAdd
{
    //MARK: internal
    
    func editTitle(title:String)
    {
        self.build?.title = title
        self.database?.save(completion:nil)
    }
}
