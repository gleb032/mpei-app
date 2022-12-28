//
//  UniversityMapView.swift
//  mpei-app
//
//  Created by Глеб Фандеев on 28.12.2022.
//

import Foundation
import MapKit

final class UniversityMapView: MKMapView {
    private let initialLocation: CLLocation
    
    init(initialLocation: CLLocation) {
        self.initialLocation = initialLocation
        
        super.init(frame: .zero)
        isZoomEnabled = true
        isRotateEnabled = false
        showsBuildings = true
        mapType = .standard
    }
    
    func centerToInitial() {
        centerToLocation(initialLocation)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
