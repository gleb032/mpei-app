//
//  Professor.swift
//  mpei-app
//
//  Created by Глеб Фандеев on 19.12.2022.
//

import Foundation

struct Professor: Codable {
    let name: String
    let department: String
    let photo: String?
    let researchWork: [String]?
}
