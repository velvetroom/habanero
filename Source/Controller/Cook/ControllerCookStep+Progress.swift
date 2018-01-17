import UIKit

extension ControllerCookStep
{
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
            
            self?.viewMain.viewProgress.viewIndicator.alpha = 1
            self?.viewMain.viewProgress.layoutIfNeeded()
        })
        { [weak self] (done:Bool) in
            
            self?.hideIndicator()
        }
    }
    
    private func hideIndicator()
    {
        UIView.animate(withDuration:ControllerCookStep.Constants.indicatorAnimationHide)
        {  [weak self] in
            
            self?.viewMain.viewProgress.viewIndicator.alpha = 0
        }
    }
    
    //MARK: internal
    
    func updateProgress(indexPath:IndexPath)
    {
        let index:Int = indexPath.item
        let total:Int = self.model.items.count - 1
        let percent:CGFloat = CGFloat(index) / CGFloat(total)
        let width:CGFloat = self.viewMain.bounds.width
        let progressWidth:CGFloat = width * percent
        
        self.viewMain.viewProgress.viewIndicator.layer.removeAllAnimations()
        
        self.updateProgress(
            index:index,
            progressWidth:progressWidth)
    }
}
