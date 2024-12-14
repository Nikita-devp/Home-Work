//
//  FireBaseController.swift
//  MyGraduationProject
//
//  Created by Злата Лашкевич on 12.12.24.
//
import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestore

protocol AuthProtocol {
    
}

enum AuthError: Error {
    case wrongLoginOrPassword
    
    var errorMessege: String {
        return switch self {
        case .wrongLoginOrPassword: "failed password"
        }
    }
}

class AuthService: AuthProtocol {
    func createUser(email: String, password: String, user: User) async -> Result<User, AuthError> {
        do {
            _ = try await Auth.auth().createUser(withEmail: email, password: password)
//            try await result.user.sendEmailVerification()
            let uid = Auth.auth().currentUser?.uid
            let userData: User = .init(id: uid!, name: user.name, surename: user.surename)
            try Firestore.firestore()
                .collection("users")
                .document(userData.id)
                .setData(from: userData)
            signOut()
            return .success(userData)
        } catch {
            print(AuthError.wrongLoginOrPassword.errorMessege)
            return .failure(.wrongLoginOrPassword)
        }
    }
    
    func sighIn(email: String, password: String) async -> Result<User, AuthError> {
        do {
            _ = try await Auth.auth().signIn(withEmail: email, password: password)
           
            return await .success(getUserData())
        } catch {
            return .failure(.wrongLoginOrPassword)
        }
    }
    
    func getUserData() async -> User {
        do {
            guard let uid = Auth.auth().currentUser?.uid else {return User()}
            let snapShot = try await Firestore.firestore().collection("users").document(uid).getDocument()
            
            let userData = try snapShot.data(as: User.self)
            return userData
        } catch {
            return User()
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            print(error)
        }
    }
    
    func isLogin() -> Bool {
        if let _ = Auth.auth().currentUser {
            return true
        } else {
            return false
        }
    }
}
