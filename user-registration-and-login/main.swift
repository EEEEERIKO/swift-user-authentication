//
//  main.swift
//  user-registration-and-login
//
//  Created by Erik Valencia Cardona on 16/09/26.
//

import Foundation

struct User {
    let username: String
    let email: String
    let passwordHash: String
    
    static func hashPassword(_ password: String) -> String {
        String(password.reversed())
    }
    
    init(username:String, email: String, password: String){
        self.username = username
        self.email = email
        self.passwordHash = User.hashPassword(password)
    }
    
    func verifyPassword(_  password: String) -> Bool{
        return User.hashPassword(password) == passwordHash
    }
    
}

class UserManager {
    var users: [String: User]
    
    var userCount: Int {
        users.count
    }
    
    init(users: [String: User] = [:]){
        self.users = users
    }
    
    func registerUser(username: String, email: String, password: String) -> Bool {
        guard users[username] == nil else {return false}
        
        users[username] = User(username: username, email: email, password: password)
        return true
    }
    
    func login(username:String, password: String) -> Bool {
        guard let user = users[username] else { return false}
        return user.verifyPassword(password)
    }
    
    func removeUser(username: String) -> Bool {
        return users.removeValue(forKey: username) != nil
    }
}

class AdminUser: UserManager {
    
    func listAllUsers() -> [String]{
        Array(users.keys).sorted()
    }
    
    deinit {
        print("AdminUser instance has been removed from memory")
    }
}

