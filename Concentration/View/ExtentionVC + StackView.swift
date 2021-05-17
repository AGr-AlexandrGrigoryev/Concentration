//
//  ExtentionVC + StackView.swift
//  Concentration
//
//  Created by Alexandr Grigoryev on 23/08/2020.
//

import Foundation
import UIKit

extension ViewController {
    
    /// Create grid for cards
    /// - Parameters:
    ///   - row: describe how many rows we want to create
    ///   - column: describe how many colums we want to create
    func stackViewGrid(row: Int, column: Int) {
        
        let rootStackView = UIStackView()
        rootStackView.translatesAutoresizingMaskIntoConstraints = false
        rootStackView.alignment = .fill
        rootStackView.axis = .vertical
        rootStackView.distribution = .fillEqually
        rootStackView.spacing = 10
        rootStackView.addArrangedSubview(label)
        
        //Horizontal stack, describe how many rows will be
        for _ in 0..<row {
            
            let horizintalSV = UIStackView()
            
            horizintalSV.translatesAutoresizingMaskIntoConstraints = false
            horizintalSV.distribution = .fillEqually
            horizintalSV.axis = .horizontal
            horizintalSV.spacing = 10
            
            //each step create new button and add to horizontal stack
            for _ in 0..<column {
                
                countOfButton += 1
                let button = CustomButton()
                button.addTarget(self, action: #selector(buttonAction(_:)), for: .touchUpInside)
                cardButtons.append(button)
                horizintalSV.addArrangedSubview(button)
            }
            
            rootStackView.addArrangedSubview(horizintalSV)
            newGameButtom.addTarget(self, action: #selector(newGame(_:)), for: .touchUpInside)
        }
    
        //rootStackView.addArrangedSubview(newGameButtom)
        view.addSubview(newGameButtom)
        CustomButton.constraintsForNewGameButtom(view: view, button: newGameButtom)
        
        self.view.addSubview(rootStackView)
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            rootStackView.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            safeArea.topAnchor.constraint(equalTo: rootStackView.topAnchor, constant: -20),
            rootStackView.widthAnchor.constraint(equalTo: safeArea.widthAnchor, multiplier: 0.8),
            rootStackView.bottomAnchor.constraint(equalTo: newGameButtom.topAnchor, constant: -50)
        ])
    }
}
