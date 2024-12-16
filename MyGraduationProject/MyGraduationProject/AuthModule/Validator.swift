//
//  Valodator.swift
//  MyGraduationProject
//
//  Created by Злата Лашкевич on 15.12.24.
//

protocol AuthValidatorServiceProtocol {
    func isValid(login: String) -> Bool
    func isValid(password: String) -> Bool
}

class AuthValidatorService: AuthValidatorServiceProtocol {
    func isValid(login: String) -> Bool { !(login.count > 16) }
    func isValid(password: String) -> Bool { password.count >= 5 }
}
