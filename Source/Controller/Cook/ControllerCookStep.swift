import UIKit

final class ControllerCookStep:Controller<ArchCookStep>
{
    init(item:HomeItem)
    {
        super.init()
        
        self.model.homeItem = item
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: private
    
    private func updateProgress(
        index:Int,
        progressWidth:CGFloat)
    {
        let indexNum:Int = index + 1
        let indexString:String = String(indexNum)
        
        self.viewMain.viewProgress.layoutBarForegroundWidth.constant = progressWidth
        self.viewMain.viewProgress.viewIndicator.label.text = indexString
        
        UIView.animate(withDuration:ViewGlobal.Constants.animationDuration,
        animations:
        {  [weak self] in
                
            self?.viewMain.viewProgress.layoutIfNeeded()
            
        })
        { [weak self] (done:Bool) in
            
        }
    }
    
    //MARK: internal
    
    func transitionClose()
    {
        self.parentController?.pop(vertical:ControllerTransition.Vertical.bottom)
    }
    
    func loadStepImage(
        item:CookStepItemImage,
        cell:ViewCookStepListCellImage)
    {
        self.model.loadStepImage(item:item)
        { (image:UIImage) in
            
            item.image = image
            
            guard
            
                cell.item === item
            
            else
            {
                return
            }
            
            cell.imageView.image = image
        }
    }
    
    func updateProgress(indexPath:IndexPath)
    {
        let index:Int = indexPath.item
        let total:Int = self.model.items.count - 1
        let percent:CGFloat = CGFloat(index) / CGFloat(total)
        let width:CGFloat = self.viewMain.bounds.width
        let progressWidth:CGFloat = width * percent
        
        self.updateProgress(
            index:index,
            progressWidth:progressWidth)
    }
}
