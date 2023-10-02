//
//  AuthViewModel.swift
//  DemoApp
//
//

import Foundation
import UIKit
import SwiftUI


class AuthViewModel : ObservableObject {
    
    @Injected var repository:AuthRepository
    @Published var loginRequest: LoginRequest = LoginRequest()
    @Published var registerRequest: RegisterRequest = RegisterRequest()
    @Published var isLoading = false
    @AppStorage("isUserLogin") private var isUserLogin: Bool = false
    @Published var isShowAlert = false
    @Published var errorMsg = ""
    
    @MainActor func login() {
        if loginRequest.email.isEmpty {
            isShowAlert.toggle()
            errorMsg = Constant.enterValidEmail
            return
        }
        if loginRequest.password.isEmpty {
            isShowAlert = true
            errorMsg = Constant.enterValidPassword
            return
        }
        if loginRequest.password.count < 8 {
            isShowAlert = true
            errorMsg = Constant.enterValidPassword
            return
        }
        else {
            isLoading = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
                guard let self else { return }
                self.isLoading = false
                self.repository.router.navigateTo(.otpView(email: loginRequest.email, viewModel: self))
            }
        }
    }
    
    @MainActor func register() {
        if registerRequest.email.isEmpty {
            isShowAlert = true
            errorMsg = Constant.enterValidEmail
            return
        }
        if registerRequest.name.isEmpty {
            isShowAlert = true
            errorMsg = Constant.enterValidName
            return
        }
        if registerRequest.password.isEmpty {
            isShowAlert = true
            errorMsg = Constant.enterValidPassword
            return
        }
        if registerRequest.password.count < 8 {
            isShowAlert = true
            errorMsg = Constant.enterValidPassword
            return
        }
        else {
            isLoading = true
            UserDefaults.standard.user = User(name: registerRequest.name,lastName:registerRequest.lastName, number:registerRequest.number, email: registerRequest.email)
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
                self?.isLoading = false
                self?.repository.router.navigateBack()
            }
        }
    }
    
    @MainActor func verifyOtp(otp:String) {
        if otp.count < 6 {
            isShowAlert = true
            errorMsg = Constant.enterValidOTP
            return
        } else {
            isUserLogin.toggle()
        }
    }
    
}
