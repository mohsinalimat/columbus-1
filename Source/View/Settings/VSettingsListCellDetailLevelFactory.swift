import UIKit

extension VSettingsListCellDetailLevel
{
    //MARK: private
    
    private func factoryTitle() -> NSAttributedString
    {
        let string:String = String.localizedView(
            key:"VSettingsListCellDetailLevel_title")
        let attributes:[
            NSAttributedStringKey:Any] = [
                NSAttributedStringKey.font:
                    UIFont.regular(size:kTitleFontSize),
                NSAttributedStringKey.foregroundColor:
                    UIColor.colourBackgroundDark]
        
        let attributedString:NSAttributedString = NSAttributedString(
            string:string,
            attributes:attributes)
        
        return attributedString
    }
    
    private func factoryDescr() -> NSAttributedString
    {
        let string:String = String.localizedView(
            key:"VSettingsListCellDetailLevel_descr")
        let attributes:[
            NSAttributedStringKey:Any] = [
                NSAttributedStringKey.font:
                    UIFont.regular(size:kDescrFontSize),
                NSAttributedStringKey.foregroundColor:
                    UIColor(white:0, alpha:0.45)]
        
        let attributedString:NSAttributedString = NSAttributedString(
            string:string,
            attributes:attributes)
        
        return attributedString
    }
    
    private func factoryCaptionString() -> NSAttributedString
    {
        let title:NSAttributedString = factoryTitle()
        let descr:NSAttributedString = factoryDescr()
        
        let mutableString:NSMutableAttributedString = NSMutableAttributedString()
        mutableString.append(title)
        mutableString.append(descr)
        
        return mutableString
    }
    
    //MARK: internal
    
    func factoryList(controller:CSettings)
    {
        guard
            
            self.viewList == nil
            
        else
        {
            return
        }
        
        let viewList:VSettingsListCellDetailLevelList = VSettingsListCellDetailLevelList(
            controller:controller)
        self.viewList = viewList
        
        addSubview(viewList)
        
        NSLayoutConstraint.topToTop(
            view:viewList,
            toView:self,
            constant:kListTop)
        NSLayoutConstraint.bottomToBottom(
            view:viewList,
            toView:self,
            constant:kListBottom)
        NSLayoutConstraint.leftToLeft(
            view:viewList,
            toView:self)
        NSLayoutConstraint.width(
            view:viewList,
            constant:kListWidth)
    }
    
    func factoryCaption()
    {
        let caption:NSAttributedString = factoryCaptionString()
        let labelCaption:UILabel = UILabel()
        labelCaption.isUserInteractionEnabled = false
        labelCaption.translatesAutoresizingMaskIntoConstraints = false
        labelCaption.backgroundColor = UIColor.clear
        labelCaption.numberOfLines = 0
        labelCaption.attributedText = caption
        
        addSubview(labelCaption)
        
        NSLayoutConstraint.topToTop(
            view:labelCaption,
            toView:self)
        NSLayoutConstraint.height(
            view:labelCaption,
            constant:kCaptionHeight)
        NSLayoutConstraint.leftToLeft(
            view:labelCaption,
            toView:self,
            constant:kCaptionLeft)
        NSLayoutConstraint.rightToRight(
            view:labelCaption,
            toView:self)
    }
}
