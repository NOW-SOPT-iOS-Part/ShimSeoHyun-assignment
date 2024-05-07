import UIKit

enum Font {
    case Nav
    case H2
    case B2
    
    func style(text:String) -> NSMutableAttributedString{
        switch self {
        case .Nav:
            return addText(text: text, font: UIFont(name:"PretendardVariable-Regular",size: 17)!, lineSpacing: 0, letterSpacing: -0.5, lineHeight: 27)

        case .H2:
            return addText(text: text, font: UIFont(name:"PretendardVariable-SemiBold",size: 15)!, lineSpacing: 0, letterSpacing: 0.1, lineHeight: 23)
           
        case .B2:
            return addText(text: text, font:  UIFont(name:"PretendardVariable-Medium",size: 10)!, lineSpacing: 0, letterSpacing: 0.1, lineHeight: 16)
        }
    }
}

func addText (text: String , font:UIFont, lineSpacing:CGFloat, letterSpacing:CGFloat, lineHeight:CGFloat) -> NSMutableAttributedString{
    let attributedString = NSMutableAttributedString(string: text, attributes: [.font: font])
    
    // 자간 생성
    attributedString.addAttribute(.kern, value: letterSpacing, range: NSRange(location: 0, length: text.count))
    
    // 행간 생성
    let paragraphStyle = NSMutableParagraphStyle()
    paragraphStyle.lineSpacing = lineSpacing
    
    // 글 높이 설정
    paragraphStyle.minimumLineHeight = lineHeight
    paragraphStyle.maximumLineHeight = lineHeight
    
    let fontHeight = font.lineHeight
    let offset = (lineHeight - fontHeight) / 2
    
    attributedString.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: text.count))
    
    attributedString.addAttribute(.baselineOffset, value: offset, range: NSRange(location: 0, length: text.count))
    
    return attributedString
    
}
