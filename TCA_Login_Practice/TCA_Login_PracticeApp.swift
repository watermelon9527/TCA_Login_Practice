//
//  TCA_Login_PracticeApp.swift
//  TCA_Login_Practice
//
//  Created by Neil Chan on 2025/5/12.
//

import SwiftUI
import ComposableArchitecture

@main
struct TCA_Login_PracticeApp: App {
    var body: some Scene {
        WindowGroup {
            LoginView(
                store: Store(initialState: Login.State()) {
                    Login()
                }
            )
        }
    }}
