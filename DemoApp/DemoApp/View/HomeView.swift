//
//  HomeView.swift
//  DemoApp
//
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var homeViewModel: HomeViewModel = HomeViewModel()
    @AppStorage("isUserLogin") private var isUserLogin: Bool = false
    @State private var email:String = ""
    @State private var name:String = ""
    @State private var lastName:String = ""
    @State private var number:String = ""
    
    var body: some View {
        RoutingView(router: homeViewModel.repository.router) {
            List {
                ForEach(homeViewModel.users) { user in
                    VStack(alignment:.leading) {
                        HStack {
                            Image(systemName: "person.circle.fill")
                                .resizable()
                                .frame(width: 24,height: 24)
                            Text("\(user.name) \(user.lastName)")
                        }
                        Text(user.number)
                    }
                }
            }
            .onAppear(perform: {
                homeViewModel.users.insert(User(name: UserDefaults.standard.user?.name ?? "",lastName: UserDefaults.standard.user?.lastName ?? "",number:UserDefaults.standard.user?.number ?? "", email: UserDefaults.standard.user?.email ?? ""), at: 0)
            })
            .navigationTitle("User Listing")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button(action: {
                    isUserLogin = false
                    UserDefaults.standard.user = nil
                }) {
                    Text("Logout")
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
