//
//  MKMapView+Extension.swift
//  mpei-app
//
//  Created by Глеб Фандеев on 28.12.2022.
//

import Foundation
import MapKit

extension MKMapView {
  func centerToLocation(
    _ location: CLLocation,
    regionRadius: CLLocationDistance = 500
  ) {
    let coordinateRegion = MKCoordinateRegion(
      center: location.coordinate,
      latitudinalMeters: regionRadius,
      longitudinalMeters: regionRadius
    )
    setRegion(coordinateRegion, animated: true)
  }
}
