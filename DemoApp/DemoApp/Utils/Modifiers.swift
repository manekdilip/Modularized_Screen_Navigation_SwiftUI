//
//  Modifiers.swift
//  DemoApp
//
//

import Foundation
import SwiftUI

extension View {
    func setButtonStyle() -> some View {
        return modifier(ThemeButton())
    }
    
    
    
    func toast(toastView: Toast, show: Binding<Bool>) -> some View {
        self.modifier(ToastModifier.init(show: show, toastView: toastView))
    }
}


struct ThemeButton: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.blue)
            .padding(.horizontal)
    }
    
}
