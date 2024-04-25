import Foundation
func koreaLangCheck(_ input: String) -> Bool {
    // 한글만을 입력받는 정규식
    let pattern = "^[ㄱ-ㅎㅏ-ㅣ가-힣]*$"
    
    // NSRegularExpression
    // a string or a sequence of characters that specifies a pattern
    // 특정한 패턴을 정의하는 string 혹은 일련의 character
    
    // NSRegularExpression을사용하여 패턴을 가진 정규식 객체 생성
    if let regex = try? NSRegularExpression(pattern: pattern, options: .caseInsensitive) {
        
        // 입력 문자열의 길이를 UTF-16 형식의 문자 수로 얻은 후,
        // NSRange를 사용하여 입력 문자열의 범위를 지정
        let range = NSRange(location: 0, length: input.utf16.count)
        if regex.firstMatch(in: input, options: [], range: range) != nil {
            // 패턴이 일치하면 true
            return true
        }
    }
    // 패턴이 일치하지 않으면 false
    return false
}

func englishLangCheck(_ input: String) -> Bool {
    // 한글만을 입력받는 정규식
    let pattern = "^[ㄱ-ㅎㅏ-ㅣ가-힣]*$"
    
    // NSRegularExpression
    // a string or a sequence of characters that specifies a pattern
    // 특정한 패턴을 정의하는 string 혹은 일련의 character
    
    // NSRegularExpression을사용하여 패턴을 가진 정규식 객체 생성
    if let regex = try? NSRegularExpression(pattern: pattern, options: .caseInsensitive) {
        
        // 입력 문자열의 길이를 UTF-16 형식의 문자 수로 얻은 후,
        // NSRange를 사용하여 입력 문자열의 범위를 지정
        let range = NSRange(location: 0, length: input.utf16.count)
        if regex.firstMatch(in: input, options: [], range: range) != nil {
            // 패턴이 일치하면 true
            return true
        }
    }
    // 패턴이 일치하지 않으면 false
    return false
}
