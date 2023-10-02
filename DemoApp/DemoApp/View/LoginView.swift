//
//  LoginView.swift
//  DemoApp
//
//

import SwiftUI

struct LoginView: View {
    
    @StateObject private var authViewModel = AuthViewModel()
    @State private var isPasswordSecure = false

    var body: some View {
        RoutingView(router: authViewModel.repository.router) {
            ZStack {
                VStack {
                    Text("LOGIN")
                        .font(.largeTitle)
                        .bold()
                    
                    TextField("Email", text: $authViewModel.loginRequest.email)
                        .padding()
                        .background(Color.white)
                        .shadow(radius: 2)
                        .padding()
                    
                    HStack {
                        if isPasswordSecure {
                            TextField("Password", text: $authViewModel.loginRequest.password)
                        } else {
                            SecureField("Password", text: $authViewModel.loginRequest.password)
                        }
                        Button(action: {isPasswordSecure.toggle()}, label: {
                            Image(systemName: isPasswordSecure ? "eye.fill" : "eye.slash.fill")
                                
                                .foregroundColor(.black)
                        })
                    }
                    .padding()
                    .background(Color.white)
                    .shadow(radius: 2)
                    .padding(EdgeInsets(top: 0, leading: 16, bottom: 16, trailing: 16))
                
                    Button {
                        authViewModel.login()
                    } label: {
                        Text("Login")
                            .setButtonStyle()
                    }
                    
                    HStack {
                        Text("Not a member yet?")
                        
                        Text("Sign Up")
                            .foregroundStyle(.blue)
                            .onTapGesture {
                                authViewModel.repository.router.navigateTo(.register(viewModel: authViewModel))
                            }
                        
                    }
                    .padding(.top)
                }
                .toast(toastView: Toast(dataModel: ToastDataModel(title: authViewModel.errorMsg, image: "exclamationmark.triangle.fill"), color: Color(uiColor: .darkGray), show: $authViewModel.isShowAlert), show: $authViewModel.isShowAlert)

                
                if authViewModel.isLoading {
                    CustomLoaderView()
                }
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
