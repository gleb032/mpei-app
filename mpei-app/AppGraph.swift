//
//  AppGraph.swift
//  mpei-app
//
//  Created by Глеб Фандеев on 19.12.2022.
//

import UIKit

protocol AppInterface {
    var rootViewController: UIViewController { get }
}

final class AppGraph: AppInterface {
    let rootViewController: UIViewController
    
    init(rootViewController: UIViewController) {
        self.rootViewController = rootViewController
    }
    
    convenience init() {
        let rootVC = ViewController()
        self.init(rootViewController: rootVC)
    }
}
