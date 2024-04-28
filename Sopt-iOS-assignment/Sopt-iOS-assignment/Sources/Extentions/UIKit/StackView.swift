import UIKit

func VerticalStackView(subViews:[UIView], spacingFloat: CGFloat) -> UIStackView {
    let stackView = UIStackView()
    stackView.axis = .vertical
    stackView.spacing = spacingFloat
    for view in subViews{
        stackView.addArrangedSubview(view)
    }
    
    return stackView
}
