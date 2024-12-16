//
//  FireBase.swift
//  MyGraduationProject
//
//  Created by Злата Лашкевич on 15.12.24.
//
import Foundation
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

struct User {
    let name: String
}

enum AuthError: Error {
    case wrongPassword
}

protocol AuthProtocol {
    func auth(login: String, password: String) async -> Result<User, AuthError>
    func logout()
}

protocol UserStorageProtocol {
    var users: [String: String] {get}
}

class UserStorageService: UserStorageProtocol {
    let users: [String : String] = [
        "ijbiubjon@mail.ru" : "123123123"
    ]
}


class AuthServiceFirebase: AuthProtocol {
    func auth(login: String, password: String) async -> Result<User, AuthError> {
        do {
            let result = try await Auth.auth().createUser(withEmail: login, password: password)
            return .success(.init(name: result.user.uid))
        } catch {
            return .failure(.wrongPassword)
        }
        
    }
    
    func logout() {
        <#code#>
    }
    
    
    
}
