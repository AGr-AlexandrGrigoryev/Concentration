//
//  CustomButton.swift
//  Concentration
//
//  Created by Alexandr Grigoryev on 08/08/2020.
//
 
import UIKit

class CustomButton: UIButton {

    static var arrayButton: [UIButton] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init() {
        super.init(frame: .zero)
        backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        setTitleColor(.white, for: .highlighted)
        layer.shadowRadius = 5.0
        layer.masksToBounds = true
        layer.cornerRadius = 8
    }
    
    
    
    static func createButtonsFromArray(title: String, count: Int) {
        for _ in 0..<count  {
            let button = UIButton()
            arrayButton.append(button)
        }
    }
    
    static func customButton(color: UIColor) -> UIView {
        let button = UIButton(type: .system)
        button.backgroundColor = color
        
        button.setTitle("NEW GAME", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 28)
        button.setTitleColor(.white, for: .normal)
        button.layer.shadowRadius = 15.0
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 8
        return button
    }
    
    static func constraintsForNewGameButtom(view: UIView, button: UIButton) {
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8),
            button.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1),
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
        ])
    }

    @objc static func buttonAction(_ sender: UIButton) {
        print("BUTTON")
        sender.shake()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
