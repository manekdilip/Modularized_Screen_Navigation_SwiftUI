//
//  ViewSpec.swift
//  DemoApp
//
//

import Foundation
import SwiftUI

enum ViewSpec: Equatable, Hashable {
    
    static func == (lhs: ViewSpec, rhs: ViewSpec) -> Bool {
        return true
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    case register(viewModel: AuthViewModel)
    case otpView(email: String, viewModel:AuthViewModel)
    case homeView
}

extension ViewSpec: Identifiable {
    var id: Self { self }
}
