//
//  ProfessorsViewController.swift
//  mpei-app
//
//  Created by Глеб Фандеев on 19.12.2022.
//

import UIKit
import SnapKit

class ProfessorsViewController: UIViewController {
    private let tableView = UITableView()
    private let professorPresenter: ProfessorPresenter
    private weak var professorsViewOutputDelegate: ProfessorsViewOutputDelegate?
    
    private var professors: [Professor] = []
    
    init(professorPresenter: ProfessorPresenter) {
        self.professorPresenter = professorPresenter
        tableView.register(
            UINib(nibName: String(describing: ProfessorViewCell.self), bundle: nil),
            forCellReuseIdentifier: String(describing: ProfessorViewCell.self)
        )
        super.init(nibName: nil, bundle: nil)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(tableView)
        tableView.sectionFooterHeight = 20.0
        
        professorPresenter.setUpViewInputDelegate(viewInputDelegate: self)
        professorsViewOutputDelegate = professorPresenter
        professorsViewOutputDelegate?.getData()
    }
    
    override func viewDidLayoutSubviews() {
        tableView.frame = view.bounds
    }
    
    func tableView(
        _ tableView: UITableView,
        heightForRowAt indexPath: IndexPath
    ) -> CGFloat {
        100
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
    func numberOfSections(in tableView: UITableView) -> Int {
        return professors.count
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
        
        cell.backgroundColor = UIColor.ProfessorsTableCell.background
        cell.layer.borderColor = UIColor.ProfessorsTableCell.border.cgColor
        cell.layer.borderWidth = 2
        cell.layer.cornerRadius = 15
        cell.clipsToBounds = true
        
        cell.configure(
            name: professors[index].name,
            department: professors[index].department,
            photo: professors[index].photo
        )
        return cell
    }
}
