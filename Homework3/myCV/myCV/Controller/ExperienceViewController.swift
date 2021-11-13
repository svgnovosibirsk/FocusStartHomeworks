//
//  ExperienceViewController.swift
//  myCV
//
//  Created by Sergey Golovin on 13.11.2021.
//

import UIKit

class ExperienceViewController: UIViewController {
    //MARK: - Views
    let titleLabel = UILabel()
    let experienceTextView = UITextView()
    let cSharpButton = UIButton()
    let swiftButton = UIButton()
    let cButton = UIButton()
    let fullNameLabel = UILabel()
    
    var buttonsStackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setButtonsStackView()
        setTitleLabel()
        setExperienceTextView()
    }
}

extension ExperienceViewController {
    // MARK: - Set TitleLabel
    private func setTitleLabel() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.systemFont(ofSize: 25)
        titleLabel.textAlignment = .center
        titleLabel.text = "Опыт разработки"
        view.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10)
        ])
    }
    
    // MARK: - Set ExperienceTextView
    private func setExperienceTextView() {
        experienceTextView.translatesAutoresizingMaskIntoConstraints = false
        experienceTextView.font = UIFont.systemFont(ofSize: 20)
        experienceTextView.text = UserProfile.instance.skills
        experienceTextView.setContentHuggingPriority(UILayoutPriority(rawValue: 260), for: .vertical)
        view.addSubview(experienceTextView)
        
        NSLayoutConstraint.activate([
            experienceTextView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            experienceTextView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            experienceTextView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            experienceTextView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.43)
        ])
    }
    
    // MARK: - Set ButtonsStackView
    private func setButtonsStackView() {
        setButtons()
        
        buttonsStackView = UIStackView(arrangedSubviews: [cSharpButton, swiftButton, cButton])
        buttonsStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonsStackView.axis = .vertical
        buttonsStackView.distribution = .fillEqually
        buttonsStackView.spacing = 10
        view.addSubview(buttonsStackView)
        
        NSLayoutConstraint.activate([
            buttonsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100),
            buttonsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 100),
            buttonsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -100)
        ])
    }
    
    // MARK: - Set Buttons
    private func setButtons() {
        cSharpButton.translatesAutoresizingMaskIntoConstraints = false
        cSharpButton.isUserInteractionEnabled = true
        cSharpButton.setTitle("C#", for: .normal)
        cSharpButton.setTitleColor(.white, for: .normal)
        cSharpButton.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        cSharpButton.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        cSharpButton.layer.cornerRadius = 5
        cSharpButton.addTarget(self, action: #selector(cSharpBtnPressed), for: .touchUpInside)
        
        swiftButton.translatesAutoresizingMaskIntoConstraints = false
        swiftButton.setTitle("Swift", for: .normal)
        swiftButton.setTitleColor(.white, for: .normal)
        swiftButton.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        swiftButton.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        swiftButton.layer.cornerRadius = 5
        swiftButton.addTarget(self, action: #selector(swiftBtnPressed), for: .touchUpInside)
        
        cButton.translatesAutoresizingMaskIntoConstraints = false
        cButton.setTitle("C", for: .normal)
        cButton.setTitleColor(.white, for: .normal)
        cButton.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        cButton.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        cButton.layer.cornerRadius = 5
        cButton.addTarget(self, action: #selector(cBtnPressed), for: .touchUpInside)
    }
    
    //MARK: - Button's methods
    @objc func cSharpBtnPressed() {
        let cSharpMessage = """
C# — объектно-ориентированный язык программирования.
Разработан в 1998—2001 годах группой инженеров компании Microsoft
под руководством Андерса Хейлсберга и Скотта Вильтаумота
как язык разработки приложений для платформы Microsoft .NET Framework.
"""
        let alertController = UIAlertController(title: "C#", message: cSharpMessage, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        present(alertController, animated: true)
    }
    
    @objc func swiftBtnPressed() {
        let swiftMessage = """
Swift — открытый мультипарадигмальный компилируемый язык программирования общего назначения.
Создан компанией Apple в первую очередь для разработчиков iOS и macOS.
Swift работает с фреймворками Cocoa и Cocoa Touch и совместим с основной кодовой базой Apple,
написанной на Objective-C.
"""
        let alertController = UIAlertController(title: "Swift", message: swiftMessage, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        present(alertController, animated: true)
    }
    
    @objc func cBtnPressed() {
        let cMessage = """
С — компилируемый статически типизированный язык программирования общего назначения,
разработанный в 1969—1973 годах сотрудником Bell Labs Деннисом Ритчи как развитие языка Би.
Первоначально был разработан для реализации операционной системы UNIX, но впоследствии
был перенесён на множество других платформ.
"""
        let alertController = UIAlertController(title: "C", message: cMessage, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        present(alertController, animated: true)
    }
}
