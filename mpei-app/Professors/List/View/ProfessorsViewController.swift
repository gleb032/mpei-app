//
//  ProfessorsViewController.swift
//  mpei-app
//
//  Created by Глеб Фандеев on 19.12.2022.
//

import UIKit
import SnapKit

class ProfessorsViewController: UIViewController {
    private let searchController: UISearchController
    private let tableView = UITableView()
    private let professorPresenter: ProfessorPresenter
    private weak var professorsViewOutputDelegate: ProfessorsViewOutputDelegate?
    
    private var professors: [Professor] = []
    private lazy var filteredProfessors: [Professor] = [] // for search
    
    init(professorPresenter: ProfessorPresenter, searchController: UISearchController) {
        self.professorPresenter = professorPresenter
        self.searchController = searchController
        tableView.register(
            UINib(nibName: String(describing: ProfessorViewCell.self), bundle: nil),
            forCellReuseIdentifier: String(describing: ProfessorViewCell.self)
        )
        super.init(nibName: nil, bundle: nil)
        tableView.delegate = self
        tableView.dataSource = self
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(tableView)
        tableView.sectionFooterHeight = 20.0
        
        professorPresenter.setUpViewInputDelegate(viewInputDelegate: self)
        professorsViewOutputDelegate = professorPresenter
        professorsViewOutputDelegate?.getData()
                
        navigationItem.searchController = searchController
    }
    
    override func viewDidLayoutSubviews() {
        tableView.frame = view.bounds
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ProfessorsViewController: ProfessorsViewInputDelegate {
    func displayData() {
        tableView.setNeedsLayout()
        tableView.layoutIfNeeded()
    }
    
    func setupData(with professors: [Professor]) {
        self.professors = professors
    }
}

extension ProfessorsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index = indexPath.section
        
        let currentProfessor = isFiltering
            ? filteredProfessors[index]
            : professors[index]
        
        let vc = ProfileViewController(
            name: currentProfessor.name,
            department: currentProfessor.department,
            researchWork: currentProfessor.researchWork,
            photo: currentProfessor.photo
        )
        if #available(iOS 15.0, *),
            let presentationController = presentationController
                as? UISheetPresentationController {
            presentationController.detents = [.medium(), .large()]
        }
        present(vc, animated: true)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return isFiltering ? filteredProfessors.count : professors.count
    }
    
    func tableView(
        _ tableView: UITableView,
        viewForHeaderInSection section: Int
    ) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = view.backgroundColor
        return headerView
    }
 
    func tableView(
        _ tableView: UITableView,
        heightForHeaderInSection section: Int
    ) -> CGFloat {
        return 3
    }
    
    func tableView(
        _ tableView: UITableView,
        heightForRowAt indexPath: IndexPath
    ) -> CGFloat {
        100
    }
}

extension ProfessorsViewController: UITableViewDataSource {
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return 1
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: String(describing: ProfessorViewCell.self)
        ) as? ProfessorViewCell else {
            return UITableViewCell()
        }
        let index = indexPath.section
        
        cell.setUp()
        
        let currentProfessor = isFiltering
            ? filteredProfessors[index]
            : professors[index]
        
        cell.configure(
            name: currentProfessor.name,
            department: currentProfessor.department,
            photo: currentProfessor.photo
        )
        return cell
    }
}

extension ProfessorsViewController: UISearchBarDelegate {
    private var isSearchBarEmpty: Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    private var isFiltering: Bool {
        let searchBarScopeIsFiltering = searchController.searchBar
            .selectedScopeButtonIndex != 0
        return searchController.isActive
                && (!isSearchBarEmpty || searchBarScopeIsFiltering)
    }
    
    private func filterContentForSearch(text: String, scope: String?) {
        filteredProfessors = professorPresenter.filterContentForSearch(
            professors: professors,
            text: text,
            scope: scope,
            isSearchBarEmpty: isSearchBarEmpty
        )
        tableView.reloadData()
    }
    
    func searchBar(
        _ searchBar: UISearchBar,
        selectedScopeButtonIndexDidChange selectedScope: Int
    ) {
        filterContentForSearch(
            text: searchBar.text ?? "",
            scope: searchBar.scopeButtonTitles?[selectedScope]
        )
    }
}

extension ProfessorsViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        filterContentForSearch(
            text: searchBar.text ?? "",
            scope: searchBar.scopeButtonTitles?[searchBar.selectedScopeButtonIndex]
        )
    }
}
