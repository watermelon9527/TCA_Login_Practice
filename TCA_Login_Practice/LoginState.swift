//
//  LoginState.swift
//  TCA_Login_Practice
//
//  Created by Neil Chan on 2025/5/12.
//

import Foundation

struct LoginState:Equatable  {
    var username: String = ""
    var password: String = ""
    var isloggedIn: Bool = false
    var loginresult: String? = nil
}
