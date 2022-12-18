//
//  APIKeys.swift
//  mpei-app
//
//  Created by Глеб Фандеев on 19.12.2022.
//

import Foundation

struct APIKeys {
    enum Environment {
        case production, testing
    }
    
    private let environment: Environment
    private let keys: NSDictionary?
    
    var mapKitKey: String {
        guard let token = keys?["mapKitKey"] as? String else {
            assertionFailure("Yandex MapKit API Key isn't in Key.plist")
            return ""
        }
        switch environment {
        case .production:
            return token
        case .testing:
            return "no-key" // just don't want to use up all requests
        }
    }
    
    init(environment: Environment) {
        self.environment = environment
        if let path = Bundle.main.path(forResource: "Keys", ofType: "plist") {
            keys = NSDictionary(contentsOfFile: path)
        } else {
            keys = nil
        }
    }
}
