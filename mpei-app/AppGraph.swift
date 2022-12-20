//
//  AppGraph.swift
//  mpei-app
//
//  Created by Глеб Фандеев on 19.12.2022.
//

import UIKit
import YandexMapsMobile

protocol AppInterface {
    var rootViewController: UIViewController { get }
}

final class AppGraph: AppInterface {
    let rootViewController: UIViewController
    
    init(rootViewController: UIViewController) {
        self.rootViewController = rootViewController
    }
    
    convenience init() {
        let tabBarControllers = [
            ProfessorsViewController(professorPresenter: ProfessorPresenter()),
            MapViewController(mapView: YMKMapView())
        ]
        let tabBarItems = [
            UITabBarItem(title: "Преподаватели", image: nil, tag: 0),
            UITabBarItem(title: "Карта корпусов", image: nil, tag: 1)
        ]
        let tabBarController = TabBarViewController(
            viewControllers: tabBarControllers,
            tabBarItems: tabBarItems
        )
        self.init(rootViewController: tabBarController)
    }
}
