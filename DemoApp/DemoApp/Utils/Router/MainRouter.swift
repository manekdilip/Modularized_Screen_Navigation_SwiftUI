//
//  MainRouter.swift
//  DemoApp
//
//

import Foundation
import SwiftUI

class MainRouter: Router {
    override func view(spec: ViewSpec, route: Router.Route) -> AnyView {
        return AnyView(buildView(spec: spec, route: route))
    }
    
}

private extension MainRouter {
    @ViewBuilder
    func buildView(spec: ViewSpec, route: Route) -> some View {
        switch spec {
        case let .register(viewModel):
            RegisterView().environmentObject(viewModel)
        case let .otpView(email, viewModel):
            OTPView(email: email).environmentObject(viewModel)
        case .homeView:
            HomeView()
        }
    }
}
