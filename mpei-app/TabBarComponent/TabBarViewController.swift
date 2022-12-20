//
//  TabBar.swift
//  mpei-app
//
//  Created by Глеб Фандеев on 19.12.2022.
//

import UIKit
import SwipeableTabBarController

class TabBarViewController: SwipeableTabBarController {
    
    init(viewControllers: [UIViewController], tabBarItems: [UITabBarItem]) {
        super.init(nibName: nil, bundle: nil)
        assert(
            viewControllers.count == tabBarItems.count,
            "viewControllers and tabBarItems count must be equal"
        )
        for (index, item) in tabBarItems.enumerated() {
            viewControllers[index].tabBarItem = item
        }
        self.viewControllers = viewControllers
        
        let appearance = UITabBarItem.appearance()
        let attributes = [
            NSAttributedString.Key.font: UIFont(name: "American Typewriter", size: 15),
            NSAttributedString.Key.foregroundColor: UIColor.black
        ]
        appearance.setTitleTextAttributes(
            attributes as [NSAttributedString.Key : Any], for: .normal
        )
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let viewControllers = viewControllers {
            selectedViewController = viewControllers[0]
        }
        // TODO: Color manager
        tabBar.backgroundColor = UIColor.TabBar.background
        swipeAnimatedTransitioning?.animationType = SwipeAnimationType.sideBySide
        tapAnimatedTransitioning?.animationType = SwipeAnimationType.push
        isCyclingEnabled = false
        tapAnimatedTransitioning = nil
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        // for convenient work with Yandex maps
        isSwipeEnabled = item.tag == MapViewController.tabViewTag
            ? false
            : true
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
