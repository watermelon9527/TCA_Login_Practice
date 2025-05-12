//
//  LoginFeatre.swift
//  TCA_Login_Practice
//
//  Created by Neil Chan on 2025/5/12.
//

import ComposableArchitecture
import Foundation


// 1️⃣ Login 是一個 Reducer，代表一個登入畫面邏輯模組
struct Login: Reducer {
    // 2️⃣ State：畫面上會需要哪些資料，就放在這裡
    struct State:Equatable  {
        var username: String = ""
        var password: String = ""
        var isLoading: Bool = false
        var loginResult: String? = nil
    }
    // 3️⃣ Action：使用者可以做哪些動作，系統會有什麼回應事件
    enum Action: Equatable {
        case usernameChanged(String)
        case passwordChanged(String)
        case loginButtonTapped
        case loginResponse(Bool)
    }
    // 4️⃣ Reducer 本體，接收 Action，更新 State，或產生副作用（Effect）
    func reduce(into state: inout State, action: Action) -> Effect<Action> {
        switch action {
        case let .usernameChanged(text):
            state.username = text
            return .none
        case let .passwordChanged(text):
            state.password = text
            return .none
            
        case .loginButtonTapped:
            state.isLoading = true
            state.loginResult = nil
            
            return .run { [state] send in
                try await Task.sleep(nanoseconds: 1_000_000_000)
                let isSuccess = state.username == "user" && state.password == "password"
                await send(.loginResponse(isSuccess))
                
            }
            
        case let .loginResponse(success):
            state.isLoading = false
            state.loginResult = success ? "Login Success" : "Login Failed"
            return .none
            
            
        }
    }
    
}

