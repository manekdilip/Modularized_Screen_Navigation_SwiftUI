//
//  Toast.swift
//  DemoApp
//
//

import Foundation
import SwiftUI

struct Toast: View {
    
    let dataModel: ToastDataModel
    let color:Color
    @Binding var show: Bool
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Image(systemName: dataModel.image)
                    .foregroundStyle(.white)
                Text(dataModel.title)
                    .foregroundStyle(.white)
            }.font(.headline)
                .foregroundColor(.primary)
                .padding([.top,.bottom],20)
                .padding([.leading,.trailing],40)
                .background(color)
                .clipShape(Capsule())
        }
        .frame(width: UIScreen.main.bounds.width / 1.25)
        .transition(AnyTransition.move(edge: .bottom).combined(with: .opacity))
        .onTapGesture {
            withAnimation {
                self.show = false
            }
        }.onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation {
                    self.show = false
                }
            }
        })
    }
}

struct ToastModifier : ViewModifier {
    @Binding var show: Bool
    
    let toastView: Toast
    
    func body(content: Content) -> some View {
        ZStack {
            content
            if show {
                toastView
            }
        }
    }
}
