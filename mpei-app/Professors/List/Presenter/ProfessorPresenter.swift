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
    
    func filterContentForSearch(
        professors: [Professor],
        text: String,
        scope: String?,
        isSearchBarEmpty: Bool
    ) -> [Professor] {
        return professors.filter { professor in
            let isSameScope = scope == nil ? true : professor.department == scope
            return isSearchBarEmpty
                ? isSameScope
                : isSameScope && professor.name.lowercased().contains(text.lowercased())
        }
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
        // no need
    }
}
