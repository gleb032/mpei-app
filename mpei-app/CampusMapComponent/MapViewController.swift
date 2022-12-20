//
//  MapViewController.swift
//  mpei-app
//
//  Created by Глеб Фандеев on 19.12.2022.
//

import UIKit
import YandexMapsMobile
import SnapKit

class MapViewController: UIViewController {
    static let tabViewTag = 1
    private let mapView: YMKMapView
    
    init(mapView: YMKMapView) {
        self.mapView = mapView
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpMapView()
    }
    
    override func viewDidLayoutSubviews() {
        mapView.layer.cornerRadius = 10
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: set up mapView

extension MapViewController {
    private func setUpMapView() {
        view.addSubview(mapView)
        mapView.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
            make.bottom.equalTo(view.snp.centerY)
        }
        
        let universityCoordinates = YMKPoint(
            latitude: 55.754877,
            longitude: 37.708185
        )
        
        mapView.mapWindow.map.move(
            with: YMKCameraPosition.init(
                target: universityCoordinates,
                zoom: 15,
                azimuth: 0,
                tilt: 0
            ),
            animationType: YMKAnimation(type: YMKAnimationType.smooth, duration: 3),
            cameraCallback: nil
        )

        mapView.mapWindow.map.mapObjects.addPlacemark(
            with: universityCoordinates,
            image: UIImage(),
            style: YMKIconStyle()
        )
    }
}
