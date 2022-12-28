//
//  mpei_appTests.swift
//  mpei-appTests
//
//  Created by Глеб Фандеев on 18.12.2022.
//

import XCTest
@testable import mpei_app

final class mpei_appTests: XCTestCase {
    private var professorPresenter: ProfessorPresenter!
    private var professors: [Professor]!
    
    override func setUpWithError() throws {
        professorPresenter = ProfessorPresenter()
        professors = [
            Professor(
                name: "Mike", department: "AMC",
                photo: nil, researchWork: nil
            ),
            Professor(
                name: "Stan", department: "AMC",
                photo: nil, researchWork: nil
            ),
            Professor(
                name: "Bob", department: "AMC",
                photo: nil, researchWork: nil
            )
        ]
    }

    override func tearDownWithError() throws {
        professors = []
    }

    func testAPIManager() throws {
        let keys = APIKeys(environment: .testing)
        let expected = "no-key"
        XCTAssertEqual(keys.mapKitKey, expected)
    }
    
    func testFiltesringContentWithScope() {
        let filtered = professorPresenter.filterContentForSearch(
            professors: professors,
            text: "M", scope: "AMC", isSearchBarEmpty: false
        )
        let expected = [
            Professor(name: "Mike", department: "AMC", photo: nil, researchWork: nil)
        ]
        XCTAssertEqual(filtered, expected)
    }
    
    func testFiltesringContentWithoutScope() {
        let filtered = professorPresenter.filterContentForSearch(
            professors: professors,
            text: "M", scope: nil, isSearchBarEmpty: true
        )
        XCTAssertEqual(filtered, professors)
    }
}

// for XCTAssertEqual
extension Professor: Equatable {
    public static func == (lhs: Professor, rhs: Professor) -> Bool {
        return lhs.name == rhs.name && lhs.department == rhs.department &&
                lhs.photo == rhs.photo && lhs.researchWork == rhs.researchWork
    }
}
