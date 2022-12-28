//
//  MapViewController.swift
//  mpei-app
//
//  Created by Глеб Фандеев on 19.12.2022.
//

import UIKit
import MapKit
import SnapKit

class MapViewController: UIViewController {
    static let tabViewTag = 1
    private let mapView: UniversityMapView
    
    init(mapView: UniversityMapView) {
        self.mapView = mapView
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpMapView()
        AnnotationsProvider().annotations.forEach { mapView.addAnnotation($0) }
    }
    
    override func viewDidLayoutSubviews() {
        mapView.layer.cornerRadius = 20
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
            make.leading.trailing.top.bottom.equalToSuperview()
        }
        mapView.centerToInitial()
    }
}
