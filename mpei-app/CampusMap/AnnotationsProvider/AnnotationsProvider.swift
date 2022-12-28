//
//  AnnotationsProvider.swift
//  mpei-app
//
//  Created by Глеб Фандеев on 28.12.2022.
//

import Foundation
import MapKit

final class AnnotationsProvider {
    let annotations: [MKPointAnnotation]
    
    init(annotations: [MKPointAnnotation]) {
        self.annotations = annotations
    }
    
    // swiftlint:disable function_body_length
    convenience init() {
        let annotations: [MKPointAnnotation] = [
            UniversityAnnotation(
                title: "А",
                coordinate: CLLocationCoordinate2D(
                    latitude: 55.755880,
                    longitude: 37.707660
                )
            ),
            UniversityAnnotation(
                title: "Б",
                coordinate: CLLocationCoordinate2D(
                    latitude: 55.755300,
                    longitude: 37.707420
                )
            ),
            UniversityAnnotation(
                title: "В",
                coordinate: CLLocationCoordinate2D(
                    latitude: 55.755300,
                    longitude: 37.708630
                )
            ),
            UniversityAnnotation(
                title: "Г",
                coordinate: CLLocationCoordinate2D(
                    latitude: 55.754600,
                    longitude: 37.709030
                )
            ),
            UniversityAnnotation(
                title: "Д",
                coordinate: CLLocationCoordinate2D(
                    latitude: 55.754990,
                    longitude: 37.709910
                )
            ),
            UniversityAnnotation(
                title: "Ж",
                coordinate: CLLocationCoordinate2D(
                    latitude: 55.754110,
                    longitude: 37.707210
                )
            ),
            UniversityAnnotation(
                title: "З",
                coordinate: CLLocationCoordinate2D(
                    latitude: 55.754310,
                    longitude: 37.706770
                )
            ),
            UniversityAnnotation(
                title: "К",
                coordinate: CLLocationCoordinate2D(
                    latitude: 55.753530,
                    longitude: 37.709330
                )
            ),
            UniversityAnnotation(
                title: "И",
                coordinate: CLLocationCoordinate2D(
                    latitude: 55.753830,
                    longitude: 37.708190
                )
            ),
            UniversityAnnotation(
                title: "Л",
                coordinate: CLLocationCoordinate2D(
                    latitude: 55.753243,
                    longitude: 37.709659
                )
            ),
            UniversityAnnotation(
                title: "М",
                coordinate: CLLocationCoordinate2D(
                    latitude: 55.756180,
                    longitude: 37.704440
                )
            ),
            UniversityAnnotation(
                title: "Е",
                coordinate: CLLocationCoordinate2D(
                    latitude: 55.756720,
                    longitude: 37.703090
                )
            ),
            UniversityAnnotation(
                title: "Н",
                coordinate: CLLocationCoordinate2D(
                    latitude: 55.757160,
                    longitude: 37.703920
                )
            ),
            UniversityAnnotation(
                title: "С",
                coordinate: CLLocationCoordinate2D(
                    latitude: 55.757500,
                    longitude: 37.702330
                )
            ),
            UniversityAnnotation(
                title: "Дом культуры",
                coordinate: CLLocationCoordinate2D(
                    latitude: 55.757400,
                    longitude: 37.708240
                )
            ),
            UniversityAnnotation(
                title: "Стадион Энергия",
                coordinate: CLLocationCoordinate2D(
                    latitude: 55.762890,
                    longitude: 37.703460
                )
            )
        ]
        self.init(annotations: annotations)
    }
}
