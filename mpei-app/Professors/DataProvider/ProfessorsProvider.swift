//
//  ProfessorsProvider.swift
//  mpei-app
//
//  Created by Глеб Фандеев on 19.12.2022.
//

import Foundation

final class ProfessorsProvider {
    /// Department of Applied Mathematics and Computer Science
    static let amcsDepartmentProfessors = [
        Professor(
            name: "Бартеньев Олег Васильевич", department: "ПМИИ", photo: nil,
            researchWork: ["Компьютерная графика", "Разработка интерфейсов"]
        ),
        Professor(
            name: "Маран Михкель Михкелевич", department: "ПМИИ", photo: nil,
            researchWork: ["Технология программирования", "Базы данных"]
        ),
        Professor(
            name: "Меньшикова Ксения Георгиевна", department: "ПМИИ", photo: nil,
            researchWork: ["Технология программирования", "Базы данных"]
        ),
        Professor(
            name: "Шамаева Ольга Юрьевна", department: "ПМИИ", photo: nil,
            researchWork: ["Параллельные вычисления", "Использование кластеров"]
        ),
        Professor(
            name: "Алексиадис Никос Филиппович", department: "ПМИИ", photo: nil,
            researchWork: ["Дискретная математика", "Теория графов"]
        ),
        Professor(
            name: "Варшавский Павел Романович", department: "ПМИИ", photo: nil,
            researchWork: [
                "Системы искусственного интеллекта", "Системы принятия решений",
                "Системы обработки знаний"
            ]
        ),
        Professor(
            name: "Еремеев Александр Павлович", department: "ПМИИ", photo: nil,
            researchWork: [
                "Системы искусственного интеллекта", "Системы принятия решений",
                "Системы обработки знаний"]
        ),
        Professor(
            name: "Кружилов Иван Сергеевич", department: "ПМИИ", photo: nil,
            researchWork: [
                "Системы искусственного интеллекта", "Системы принятия решений",
                "Системы обработки знаний", "Технология программирования",
                "Базы данных"
            ]
        ),
        Professor(
            name: "Куриленко Иван Евгеньевич", department: "ПМИИ", photo: nil,
            researchWork: [
                "Системы искусственного интеллекта", "Системы принятия решений",
                "Системы обработки знаний", "Технология программирования",
                "Базы данных"
            ]
        )
    ]
    
    static let mmDepartmentProfessors: [Professor] = [
        .init(
            name: "Амосов Андрей Авенирович", department: "ММ", photo: nil,
            researchWork: [
                "Нелинейные краевые задачи математической физики",
                "Численные методы",
                "Математическое моделирование физических явлений"
            ]
        ),
        .init(
            name: "Амосова Ольга Алексеевна", department: "ММ", photo: nil,
            researchWork: [
                "Численные методы",
                "Уравнения с частными производными"
            ]
        ),
        .init(
            name: "Бирюков Алексей Михайлович", department: "ММ", photo: nil,
            researchWork: [
                "Задачи комплексной математической физики"
            ]
        ),
        .init(
            name: "Зубков Павел Валерьевич", department: "ММ", photo: nil,
            researchWork: [
                "Нелинейные аналитические задачи математической физики",
                "Оптимальное управление"
            ]
        )
    ]
}
