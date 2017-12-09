import Foundation

extension NewAdd
{
    //MARK: internal
    
    func editTitle(title:String)
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
                
            self?.build?.title = title
            self?.database?.save(completion:nil)
        }
    }
    
    func durationEdited(duration:TimeInterval)
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.build?.duration = duration
            self?.database?.save(completion:nil)
        }
    }
}
