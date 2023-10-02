//
//  OTPView.swift
//  DemoApp
//
//

import SwiftUI

struct OTPView: View {

    let email:String
    @EnvironmentObject var authViewModel:AuthViewModel
    @State private var otp: [String] = Array(repeating: "", count: 6)
    @State private var timer: Timer?
    @State private var counter = 0

    func startTimer() {
        counter = 30
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            if counter > 0 {
                counter -= 1
            } else {
                timer.invalidate()
                self.timer = nil
            }
        }
    }
    
    var body: some View {
        VStack(alignment:.leading,spacing:0) {
            Button {
                authViewModel.repository.router.navigateBack()
            } label: {
                Image(systemName: "chevron.left.circle.fill")
            }
            .padding()
            
            Text("OTP Verification")
                .font(.largeTitle).bold()
                .foregroundColor(.black)
                .padding(.horizontal)

            Text("We have sent a verification code to")
                .foregroundColor(Color.black)
                .padding(.top,8)
                .padding(.horizontal)
            
            Text("\(email)")
                .foregroundColor(Color.gray)
                .padding(.horizontal)
        
            OTPTextField(numberOfFields: 6, enterValue: $otp)
            .padding(EdgeInsets(top: 25, leading: 0, bottom: 30, trailing: 0))
            .frame(maxWidth: .infinity,alignment: .center)
                   
            Button {
                authViewModel.verifyOtp(otp: otp.joined(separator: ""))
            } label: {
                Text("Verify")
                    .setButtonStyle()
            }
            
            Group {
                if counter == 0 {
                    HStack {
                        Spacer()
                        Text("Didn’t receive the code?")
                        
                        Button {
                            startTimer()
                        } label: {
                            Text("Resend")
                        }
                        Spacer()
                    }
                } else {
                    if counter < 10 {
                        Text("00 : 0\(counter)")
                            .frame(maxWidth: .infinity,alignment: .center)
                    } else {
                        Text("00 : \(counter)")
                            .frame(maxWidth: .infinity,alignment: .center)
                    }
                }
            }
            .padding(.top,51)
            Spacer()
        }
        .navigationTitle("")
        .navigationBarHidden(true)
        .onAppear {
            startTimer()
        }
        .toast(toastView: Toast(dataModel: ToastDataModel(title: authViewModel.errorMsg, image: "exclamationmark.triangle.fill"), color: Color(uiColor: .darkGray), show: $authViewModel.isShowAlert), show: $authViewModel.isShowAlert)

    }
}

#Preview {
    OTPView(email: "123456789").environmentObject(AuthViewModel())
}
