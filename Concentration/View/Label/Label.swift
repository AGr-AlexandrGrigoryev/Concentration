//
//  Label.swift
//  Concentration
//
//  Created by Alexandr Grigoryev on 22/08/2020.
//

import Foundation
import UIKit

class Label: UILabel{
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(label: String) {
        super.init(frame: .zero)
        text = label
        backgroundColor = .systemBackground

        font = UIFont.boldSystemFont(ofSize: 42)
        numberOfLines = 2
    }
    
    func constraints(for label: UILabel,of view: UIView ) {
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            label.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            label.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.9)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
