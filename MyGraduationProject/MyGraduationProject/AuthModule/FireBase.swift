import Foundation
import FirebaseAuth
import Firebase


class AuthService {
    
    
    func createNewUser(user: UserData, complition: @escaping(Result<Bool, Error>) -> Void) {
        Auth.auth().createUser(withEmail: user.email, password: user.password) { [weak self] result, err in
            guard let self = self else {return}
            guard err == nil else {
                print(err!)
                complition(.failure(err!))
                return
            }
            
            result?.user.sendEmailVerification()
            signOut()
            complition(.success(true))
        }
    }
    
    func signIn(user: UserData, complition: @escaping(Result<Bool, Error>) -> Void){
        Auth.auth().signIn(withEmail: user.email, password: user.password) { [weak self] result, err in
            guard let self = self else {return}
            guard err == nil else {
                print(err!)
                complition(.failure(err!))
                return
            }
            
            guard let user = result?.user else {
                complition(.failure(Failure.invalidUser))
                return
            }
            if !user.isEmailVerified {
                complition(.failure(Failure.notVerified ))
                signOut()
                return
            }
            
            complition(.success(true))
        }
    }
    
    func signOut(){
        do {
            try Auth.auth().signOut()
        } catch {
            print(error)
        }
    }
    
    func isLogin() -> Bool{
        if let _ = Auth.auth().currentUser {
            return true
        }
            return false
    }
    
    
}


enum Failure: Error {
    case invalidUser
    case notVerified
}
