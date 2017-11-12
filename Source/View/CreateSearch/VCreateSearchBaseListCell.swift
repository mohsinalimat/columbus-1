import MapKit

final class VCreateSearchBaseListCell:UICollectionViewCell
{
    private weak var label:UILabel!
    private weak var layoutLabelHeight:NSLayoutConstraint!
    let attributesTitle:[NSAttributedStringKey:Any]
    let attributesTitleHighlighted:[NSAttributedStringKey:Any]
    let attributesSubtitle:[NSAttributedStringKey:Any]
    let attributesSubtitleHighlighted:[NSAttributedStringKey:Any]
    let breakLine:NSAttributedString
    private var text:NSAttributedString?
    private let kBreakLine:String = "\n"
    private let kTitleFontSize:CGFloat = 14
    private let kSubtitleFontSize:CGFloat = 11
    private let kMargin:CGFloat = 10
    private let kTextMaxHeight:CGFloat = 1000
    
    override init(frame:CGRect)
    {
        let colourLabel:UIColor = UIColor(white:0, alpha:0.6)
        let colourLabelHighlighted:UIColor = UIColor.colourBackgroundDark
        
        attributesTitle = [
            NSAttributedStringKey.font:
                UIFont.regular(size:kTitleFontSize),
            NSAttributedStringKey.foregroundColor:
                colourLabel]
        
        attributesTitleHighlighted = [
            NSAttributedStringKey.font:
                UIFont.medium(size:kTitleFontSize),
            NSAttributedStringKey.foregroundColor:
                colourLabelHighlighted]
        
        attributesSubtitle = [
            NSAttributedStringKey.font:
                UIFont.regular(size:kSubtitleFontSize),
            NSAttributedStringKey.foregroundColor:
                colourLabel]
        
        attributesSubtitleHighlighted = [
            NSAttributedStringKey.font:
                UIFont.medium(size:kSubtitleFontSize),
            NSAttributedStringKey.foregroundColor:
                colourLabelHighlighted]
        
        breakLine = NSAttributedString(string:kBreakLine)
        
        super.init(frame:frame)
        clipsToBounds = true
        
        let label:UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.clear
        label.isUserInteractionEnabled = false
        label.numberOfLines = 0
        self.label = label
        
        addSubview(label)
        
        NSLayoutConstraint.topToTop(
            view:label,
            toView:self,
            constant:kMargin)
        layoutLabelHeight = NSLayoutConstraint.height(
            view:label)
        NSLayoutConstraint.equalsHorizontal(
            view:label,
            toView:self,
            margin:kMargin)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override var isSelected:Bool
    {
        didSet
        {
            hover()
        }
    }
    
    override var isHighlighted:Bool
    {
        didSet
        {
            hover()
        }
    }
    
    //MARK: private
    
    private func hover()
    {
        if isSelected || isHighlighted
        {
            backgroundColor = UIColor.colourSuccess
            label.textColor = UIColor.white
        }
        else
        {
            backgroundColor = UIColor.white
            label.attributedText = text
        }
    }
    
    private func updateHeight()
    {
        guard
            
            let text:NSAttributedString = self.text
        
        else
        {
            return
        }
        
        let size:CGSize = CGSize(
            width:label.bounds.width,
            height:kTextMaxHeight)
        
        let rect:CGRect = text.boundingRect(
            with:size,
            options:NSStringDrawingOptions([
                NSStringDrawingOptions.usesLineFragmentOrigin,
                NSStringDrawingOptions.usesFontLeading]),
            context:nil)
        let height:CGFloat = ceil(rect.height)
        
        layoutLabelHeight.constant = height
    }
    
    //MARK: internal
    
    func config(model:MKLocalSearchCompletion)
    {
        text = factoryText(model:model)
        updateHeight()
        hover()
    }
}