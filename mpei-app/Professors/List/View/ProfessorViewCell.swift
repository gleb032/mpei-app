//
//  TableViewCell.swift
//  mpei-app
//
//  Created by Глеб Фандеев on 19.12.2022.
//

import UIKit

class ProfessorViewCell: UITableViewCell {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var department: UILabel!
    @IBOutlet weak var photo: UIImageView!
    
    func configure(name: String, department: String, photo: String? = nil) {
        DispatchQueue.main.async {
            self.name.text = name
            self.department.text = department
            self.photo.image = UIImage(named: photo ?? "default_photo")
        }
    }
    
    func setUp() {
        backgroundColor = UIColor.ProfessorsTableCell.background
        layer.borderColor = UIColor.ProfessorsTableCell.border.cgColor
        layer.borderWidth = 2
        layer.cornerRadius = 15
        clipsToBounds = true
    }
}
