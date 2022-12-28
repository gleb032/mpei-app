//
//  AppGraph.swift
//  mpei-app
//
//  Created by Глеб Фандеев on 19.12.2022.
//

import UIKit
import MapKit

protocol AppInterface {
    var rootViewController: UIViewController { get }
}

final class AppGraph: AppInterface {
    let rootViewController: UIViewController
    
    init(rootViewController: UIViewController) {
        self.rootViewController = rootViewController
    }
    
    convenience init() {
        let searchController: UISearchController = {
            let search = UISearchController(searchResultsController: nil)
            search.obscuresBackgroundDuringPresentation = false
            search.searchBar.placeholder = "Найти преподователя..."
            search.searchBar.sizeToFit()
            search.searchBar.searchBarStyle = .prominent
            search.searchBar.scopeButtonTitles = ["ПМИИ", "ММ"]
            return search
        }()
        let universityCoordinates = CLLocation(
            latitude: 55.754877,
            longitude: 37.708185
        )
        let tabBarControllers = [
            UINavigationController(
                rootViewController: ProfessorsViewController(
                    professorPresenter: ProfessorPresenter(),
                    searchController: searchController
                )
            ),
            MapViewController(
                mapView: UniversityMapView(initialLocation: universityCoordinates)
            )
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
