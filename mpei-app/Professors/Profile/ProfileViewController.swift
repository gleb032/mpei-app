//
//  ProfileViewController.swift
//  mpei-app
//
//  Created by Глеб Фандеев on 19.12.2022.
//

import UIKit
import SnapKit

class ProfileViewController: UIViewController {
    private let name: UILabel
    private let department: UILabel
    private let researchWork: UILabel
    private let photo: UIImageView
    // Remove or DI
    private let departmentLogo: UIImageView
    
    init(name: String, department: String, researchWork: [String]?, photo: String?) {
        self.name = LabelFactory.makeLabel(text: name, font: .boldSystemFont(ofSize: 30))
        self.department = LabelFactory.makeLabel(text: department, color: .lightGray)
        self.researchWork = LabelFactory.makeLabel(
            text: "Hаучная работа:\n" + (researchWork ?? [])
                    .map {"➖" + $0}.joined(separator: "\n"),
            color: .darkGray,
            font: .systemFont(ofSize: 20),
            alignment: .left
        )
        self.photo = UIImageView(image: UIImage(named: photo ?? "default_photo"))
        self.departmentLogo = UIImageView(image: UIImage(named: "appmat"))
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLayout()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ProfileViewController {
    private func setupLayout() {
        view.addSubview(photo)
        photo.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.equalToSuperview().offset(10)
            make.width.equalToSuperview().dividedBy(2).offset(-20)
            make.height.equalToSuperview().dividedBy(4)
        }
        
        view.addSubview(departmentLogo)
        departmentLogo.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.height.equalToSuperview().dividedBy(4).offset(-15)
            make.width.equalToSuperview().dividedBy(2).offset(-20)
        }
        
        view.addSubview(name)
        name.snp.makeConstraints { make in
            make.top.equalTo(photo.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().offset(10)
            make.height.equalTo(100)
        }
        
        view.addSubview(researchWork)
        researchWork.snp.makeConstraints { make in
            make.top.equalTo(name.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().offset(10)
        }
    }
}
