import UIKit

final class ControllerNewAdd:Controller<ArchNewAdd>, UIGestureRecognizerDelegate
{
    init(
        build:Build,
        settings:Settings,
        database:Database)
    {
        super.init()
        
        self.model.database = database
        self.model.settings = settings
        self.model.build = build
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let longPressGesture:UILongPressGestureRecognizer = UILongPressGestureRecognizer(
            target:self,
            action:#selector(self.selectorLongPressGesture(sender:)))
        longPressGesture.delegate = self
        self.viewMain.viewList.collectionView.addGestureRecognizer(longPressGesture)
    }
    
    override func viewDidAppear(_ animated:Bool)
    {
        super.viewDidAppear(animated)
        
        self.viewMain.viewList.isUserInteractionEnabled = false
        self.loadModel()
    }
    
    //MARK: selectors
    
    @objc
    private func selectorLongPressGesture(sender gesture:UILongPressGestureRecognizer)
    {
        self.gestureReceived(gesture:gesture)
    }
    
    //MARK: private
    
    private func updateSections()
    {
        self.viewMain.viewList.isUserInteractionEnabled = true
        self.viewMain.viewList.collectionView.reloadData()
    }
    
    //MARK: internal
    
    func loadModel()
    {
        self.model.load
        { [weak self] in
            
            self?.updateSections()
        }
    }
    
    func transitionBack()
    {
        self.parentController?.pop(horizontal:ControllerTransition.Horizontal.right)
    }
    
    //MARK: gesture delegate
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer:UIGestureRecognizer) -> Bool
    {
        let should:Bool = self.isDraggableLocation(gesture:gestureRecognizer)
        
        return should
    }
}
