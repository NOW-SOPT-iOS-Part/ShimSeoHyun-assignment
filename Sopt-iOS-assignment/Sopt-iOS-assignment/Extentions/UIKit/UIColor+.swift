import UIKit

extension UIColor {
   // Hex color 코드를 UIColor로 변환하는 메서드
   convenience init(fromHex: String, alpha: CGFloat = 1.0) {
      let v = fromHex.map { String($0) } + Array(repeating: "0", count: max(6 - fromHex.count, 0))
      
      let r = CGFloat(Int(v[0] + v[1], radix: 16) ?? 0) / 255.0
      let g = CGFloat(Int(v[2] + v[3], radix: 16) ?? 0) / 255.0
      let b = CGFloat(Int(v[4] + v[5], radix: 16) ?? 0) / 255.0
      
      self.init(red: r, green: g, blue: b, alpha: alpha)
   }
   
   @nonobjc static var black: UIColor {
      return UIColor(fromHex: "000000", alpha: 1.0)
   }
   @nonobjc static var white: UIColor {
      return UIColor(fromHex: "ffffff", alpha: 1.0)
   }
   @nonobjc static var red: UIColor {
      return UIColor(fromHex: "FF143C", alpha: 1.0)
   }
   @nonobjc static var grey1: UIColor {
      return UIColor(fromHex: "D6D6D6", alpha: 1.0)
   }
   @nonobjc static var grey2: UIColor {
      return UIColor(fromHex: "9C9C9C", alpha: 1.0)
   }
   @nonobjc static var grey3: UIColor {
      return UIColor(fromHex: "626262", alpha: 1.0)
   }
   @nonobjc static var grey4: UIColor {
      return UIColor(fromHex: "2E2E2E", alpha: 1.0)
   }
   @nonobjc static var grey5: UIColor {
      return UIColor(fromHex: "191919", alpha: 1.0)
   }
   
}
