//
//  Network.swift
//  TestWork
//
//  Created by Pavel Vaskou on 18.09.23.
//

import Foundation
import Apollo

class Network {
    static let shared = Network()
    private(set) lazy var apollo: ApolloClient = {
        let client = ApolloClient(url: URL(string: "https://rickandmortyapi.com/graphql")!)
        return client
    }()
}
