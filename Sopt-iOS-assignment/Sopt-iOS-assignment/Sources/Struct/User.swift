struct User {
    var id: String? = nil
    var nickname: String? = nil
    
    mutating func setId(id: String?) {
        self.id = id
    } 
    
    mutating func setNickname(nickname: String?) {
        self.nickname = nickname
    }
}
