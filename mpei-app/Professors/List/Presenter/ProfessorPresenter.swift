//
//  ProfessorPresenter.swift
//  mpei-app
//
//  Created by Глеб Фандеев on 19.12.2022.
//

import Foundation

final class ProfessorPresenter {
    weak private var professorsViewInputDelegate: ProfessorsViewInputDelegate?
    
    func setUpViewInputDelegate(viewInputDelegate: ProfessorsViewInputDelegate) {
        self.professorsViewInputDelegate = viewInputDelegate
    }
    
}

extension ProfessorPresenter: ProfessorsViewOutputDelegate {
    func getData() {
        professorsViewInputDelegate?.setupData(
            with: ProfessorsProvider.amcsDepartmentProfessors
        )
        professorsViewInputDelegate?.displayData()
    }
    
    func saveData() {
        
    }
}
