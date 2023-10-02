//
//  AppModule.swift
//  DemoApp
//
//

import Foundation

extension Resolver: ResolverRegistering {
    public static func registerAllServices() {
        defaultScope = .graph
        registerRepository()
    }
    
    private static func registerRepository() {
        register { AuthRepository() }
        register { HomeRepository() }
    }
}
