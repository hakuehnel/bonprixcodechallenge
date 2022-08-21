//
//  AppDelegate+Injection.swift
//  BonprixCodeChallenge
//
//  Created by Hannes Kühnel on 18.08.22.
//
// according to docs: https://github.com/hmlongco/Resolver/blob/master/Documentation/Registration.md

import Resolver

extension Resolver: ResolverRegistering {
    public static func registerAllServices() {
        register { ServerCommunication() }
        
        register { ListViewModel() }
        register { AssortmentViewModel(serverCommunication: ServerCommunication()) }
        
        register { WebViewController() }
        register { ListViewController() }
    }
}
