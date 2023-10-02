//
//  CustomLoaderView.swift
//  DemoApp
//
//

import SwiftUI

struct CustomLoaderView: View {
    var body: some View {
        ZStack {
            Color.black.opacity(0.4)
                .ignoresSafeArea()
            VStack {
                ProgressView()
                    .padding(24)
            }
            .background(Color.white)
            .cornerRadius(4)
        }
    }
}

struct CustomLoaderView_Previews: PreviewProvider {
    static var previews: some View {
        CustomLoaderView()
    }
}
