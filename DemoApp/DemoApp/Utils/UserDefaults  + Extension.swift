//
//  UserDefaults  + Extension.swift
//  DemoApp
//
//

import Foundation
import Foundation

extension UserDefaults {
    enum Key: String, CaseIterable {
        case user
        var value: String { "mt.DemoApp.\(self.rawValue.lowercased())" }
    }
    
}

extension UserDefaults {
    
    var user:User? {
        get {
            if let savedUser = UserDefaults.standard.object(forKey: Key.user.rawValue) as? Data {
                do {
                    let loadedUser = try JSONDecoder().decode(User.self, from: savedUser)
                    return loadedUser
                } catch { }
            }
            return nil
        } set {
            do {
                let encoded = try JSONEncoder().encode(newValue)
                UserDefaults.standard.set(encoded, forKey: Key.user.rawValue)
                UserDefaults.standard.synchronize()
            } catch { }
        }
    }
    
}
