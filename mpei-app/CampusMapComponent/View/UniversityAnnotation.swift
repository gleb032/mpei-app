//
//  UniversityAnnotation.swift
//  mpei-app
//
//  Created by Глеб Фандеев on 28.12.2022.
//

import Foundation
import MapKit

final class UniversityAnnotation: MKPointAnnotation {
    init(title: String?, coordinate: CLLocationCoordinate2D) {
        super.init()
        self.title = title
        self.coordinate = coordinate
    }
}
