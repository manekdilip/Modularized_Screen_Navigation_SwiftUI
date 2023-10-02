//
//  HomeViewModel.swift
//  DemoApp
//
//

import Foundation

class HomeViewModel : ObservableObject {
    
    @Injected var repository:HomeRepository
    
    var users = [
        User(name: "Jon",lastName: "Doe",number:"+51449933", email: "Jon@gmail.com"),
        User(name: "Sofia",lastName: "Ansari",number:"+51449ddd933", email: "Jon@gmail.com"),
        User(name: "Francesca",lastName: "Doe",number:"+145436777", email: "Jon@gmail.com"),
        User(name: "Astrid",lastName: "Man",number:"+1633457567", email: "Jon@gmail.com"),
        User(name: "Lucia",lastName: "Elevan",number:"+167565756", email: "Jon@gmail.com"),
        User(name: "Amara",lastName: "Even",number:"+151449556933", email: "Jon@gmail.com"),
        User(name: "Ariel",lastName: "Doe",number:"+14551449933", email: "Jon@gmail.com"),
        User(name: "Valentina",lastName: "Blaze",number:"+15145649933", email: "Jon@gmail.com"),
       
    ]

}
