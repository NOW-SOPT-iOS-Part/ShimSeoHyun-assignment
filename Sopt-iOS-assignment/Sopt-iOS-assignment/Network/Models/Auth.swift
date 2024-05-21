class Auth {
    static let shared = Auth()
    
    private init () {}
    
    var id : String?
    var password : String?
    var nickname : String = ""
}
