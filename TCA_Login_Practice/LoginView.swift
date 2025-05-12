//
//  LoginView.swift
//  TCA_Login_Practice
//
//  Created by Neil Chan on 2025/5/12.
//

import SwiftUI
import ComposableArchitecture

// 這是登入畫面的主要視圖，使用 SwiftUI 和 Composable Architecture。
// 它接收一個 Login 類型的 store，其中包含登入過程的狀態和動作。
struct LoginView: View {
    let store: StoreOf <Login>
    
    var body: some View {
        // WithViewStore 用於觀察狀態並發送動作。
        WithViewStore(store, observe: {$0}) { content in
            VStack(spacing: 16){
                // 用於輸入使用者名稱的 TextField，綁定到使用者名稱狀態。
                TextField("Username", text: content.binding(get: \.username, send: Login.Action.usernameChanged))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                // 用於輸入密碼的 SecureField，綁定到密碼狀態。
                SecureField("Password", text: content.binding(
                    get: \.password,
                    send: Login.Action.passwordChanged
                ))
                .textFieldStyle(RoundedBorderTextFieldStyle())
                
                // 當載入中時顯示進度視圖，否則顯示登入按鈕。
                if content.isLoading {
                    ProgressView("Logging in...")
                } else {
                    Button("Login") {
                        content.send(.loginButtonTapped)
                    }
                }
                
                // 顯示登入結果，顏色指示成功或失敗。
                if let result = content.loginResult {
                    Text(result)
                        .foregroundColor(result.contains("Success") ? .green : .red)
                }
            }
            .padding()
            .background(Color.gray.opacity(0.2))
        }
    }
    
}

// LoginView 的預覽提供者，對 SwiftUI 預覽很有用。
#Preview {
    LoginView(
        store: Store(initialState: Login.State()) {
            Login()
        }
    )
}
