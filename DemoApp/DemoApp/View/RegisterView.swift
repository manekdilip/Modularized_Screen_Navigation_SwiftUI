//
//  RegisterView.swift
//  DemoApp
//
//

import SwiftUI

struct RegisterView: View {
    
    @EnvironmentObject var authViewModel:AuthViewModel
    @State private var isPasswordSecure = false
    
    var body: some View {
        ZStack {
            VStack(alignment:.leading) {
                Button {
                    authViewModel.repository.router.navigateBack()
                } label: {
                    Image(systemName: "chevron.left.circle.fill")
                }
                .padding()
                
                ScrollView {
                    VStack(alignment:.leading) {
                        Text("Register")
                            .font(.largeTitle)
                            .bold()
                            .padding(.horizontal)
                        
                        TextField("Email", text: $authViewModel.registerRequest.email)
                            .padding()
                            .background(Color.white)
                            .shadow(radius: 2)
                            .padding()
                        
                        TextField("First Name", text: $authViewModel.registerRequest.name)
                            .padding()
                            .background(Color.white)
                            .shadow(radius: 2)
                            .padding(EdgeInsets(top: 0, leading: 16, bottom: 16, trailing: 16))

                        TextField("Last Name", text: $authViewModel.registerRequest.lastName)
                            .padding()
                            .background(Color.white)
                            .shadow(radius: 2)
                            .padding(EdgeInsets(top: 0, leading: 16, bottom: 16, trailing: 16))

                        TextField("Number", text: $authViewModel.registerRequest.number)
                            .padding()
                            .background(Color.white)
                            .shadow(radius: 2)
                            .keyboardType(.numberPad)
                            .padding(EdgeInsets(top: 0, leading: 16, bottom: 16, trailing: 16))

                        
                        HStack {
                            if isPasswordSecure {
                                TextField("Password", text: $authViewModel.registerRequest.password)
                            } else {
                                SecureField("Password", text: $authViewModel.registerRequest.password)
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
                    }
                }
                
                Button {
                    authViewModel.register()
                } label: {
                    Text("Register")
                        .setButtonStyle()
                }
                
                Spacer()
            }
            if authViewModel.isLoading {
                CustomLoaderView()
            }
        }
        .navigationTitle("")
        .navigationBarHidden(true)
        .toast(toastView: Toast(dataModel: ToastDataModel(title: authViewModel.errorMsg, image: "exclamationmark.triangle.fill"), color: Color(uiColor: .darkGray), show: $authViewModel.isShowAlert), show: $authViewModel.isShowAlert)

    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView().environmentObject(AuthViewModel())
    }
}
