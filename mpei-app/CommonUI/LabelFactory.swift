//
//  LabelFactory.swift
//  mpei-app
//
//  Created by Глеб Фандеев on 19.12.2022.
//

import UIKit

struct LabelFactory {
    private let text: String
    private let color: UIColor
    private let font: UIFont

    init(text: String, color: UIColor, font: UIFont) {
        self.text = text
        self.color = color
        self.font = font
    }

    func makeLabel(text: String, color: UIColor, font: UIFont) -> UILabel {
        return LabelFactory.makeLabel(text: text, color: color, font: font)
    }

    static func makeLabel(
        text: String,
        color: UIColor = .black,
        font: UIFont = .systemFont(ofSize: 15),
        alignment: NSTextAlignment = .center
    ) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = color
        label.font = font
        label.textAlignment = alignment
        label.sizeToFit()
        label.numberOfLines = 0
        return label
    }
}
