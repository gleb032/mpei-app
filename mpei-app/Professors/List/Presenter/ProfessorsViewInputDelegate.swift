//
//  ProfessorsViewInput.swift
//  mpei-app
//
//  Created by Глеб Фандеев on 19.12.2022.
//

import Foundation

protocol ProfessorsViewInputDelegate: AnyObject {
    func setupData(with professors: [Professor])
    func displayData()
}
