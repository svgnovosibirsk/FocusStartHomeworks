//
//  ExperienceViewController.swift
//  myCV
//
//  Created by Sergey Golovin on 13.11.2021.
//

import UIKit

final class ExperienceViewController: UIViewController {
    //MARK: - Views
    private enum ExperienceViews {
        static let titleLabel = UILabel()
        static let experienceTextView = UITextView()
        static let cSharpButton = UIButton()
        static let swiftButton = UIButton()
        static let cButton = UIButton()
        static let fullNameLabel = UILabel()
    }
    
    //MARK: - Constants
    private enum ExperienceConstants {
        static let titleLabelFontSize: CGFloat = 25
        static let titleLabelTopAnchorConstant: CGFloat = 10
        
        static let experienceTextViewFontSize: CGFloat = 20
        static let experienceTextViewHuggingPriority: Float = 260
        static let experienceTextViewTopAnchorConstant: CGFloat = 20
        static let experienceTextViewLeadingConstant: CGFloat = 10
        static let experienceTextViewTrailingConstant: CGFloat = -10
        static let experienceTextViewHeightAnchorMultyplyer: CGFloat = 0.4
        
        static let buttonsStackViewSpacing: CGFloat = 10
        static let buttonsStackViewBottomAnchorConstant: CGFloat = -100
        static let buttonsStackViewLeadingConstant: CGFloat = 100
        static let buttonsStackViewTrailingConstant: CGFloat = -100
        
        static let lenguagesButtonsFontSize: CGFloat = 25
        static let lenguagesButtonsCornerRadius: CGFloat = 5
    }
   
    
    private let userProfile = UserProfile()
    
    private var buttonsStackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setButtonsStackView()
        setTitleLabel()
        setExperienceTextView()
    }
}

private extension ExperienceViewController {
    // MARK: - Set TitleLabel
    func setTitleLabel() {
        ExperienceViews.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        ExperienceViews.titleLabel.font = UIFont.systemFont(ofSize: ExperienceConstants.titleLabelFontSize)
        ExperienceViews.titleLabel.text = "Опыт разработки"
        view.addSubview(ExperienceViews.titleLabel)
        
        NSLayoutConstraint.activate([
            ExperienceViews.titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ExperienceViews.titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: ExperienceConstants.titleLabelTopAnchorConstant)
        ])
    }
    
    // MARK: - Set ExperienceTextView
    func setExperienceTextView() {
        ExperienceViews.experienceTextView.translatesAutoresizingMaskIntoConstraints = false
        ExperienceViews.experienceTextView.font = UIFont.systemFont(ofSize: ExperienceConstants.experienceTextViewFontSize)
        ExperienceViews.experienceTextView.text = userProfile.skills
        ExperienceViews.experienceTextView.setContentHuggingPriority(UILayoutPriority(rawValue: ExperienceConstants.experienceTextViewHuggingPriority), for: .vertical)
        ExperienceViews.experienceTextView.isEditable = false
        ExperienceViews.experienceTextView.isSelectable = false
        view.addSubview(ExperienceViews.experienceTextView)
        
        NSLayoutConstraint.activate([
            ExperienceViews.experienceTextView.topAnchor.constraint(equalTo: ExperienceViews.titleLabel.bottomAnchor, constant: ExperienceConstants.experienceTextViewTopAnchorConstant),
            ExperienceViews.experienceTextView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: ExperienceConstants.experienceTextViewLeadingConstant),
            ExperienceViews.experienceTextView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: ExperienceConstants.experienceTextViewTrailingConstant),
            ExperienceViews.experienceTextView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * ExperienceConstants.experienceTextViewHeightAnchorMultyplyer)
        ])
    }
    
    // MARK: - Set ButtonsStackView
    func setButtonsStackView() {
        setButtons()
        
        buttonsStackView = UIStackView(arrangedSubviews: [ExperienceViews.cSharpButton, ExperienceViews.swiftButton, ExperienceViews.cButton])
        buttonsStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonsStackView.axis = .vertical
        buttonsStackView.distribution = .fillEqually
        buttonsStackView.spacing = ExperienceConstants.buttonsStackViewSpacing
        view.addSubview(buttonsStackView)
        
        NSLayoutConstraint.activate([
            buttonsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: ExperienceConstants.buttonsStackViewBottomAnchorConstant),
            buttonsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: ExperienceConstants.buttonsStackViewLeadingConstant),
            buttonsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: ExperienceConstants.buttonsStackViewTrailingConstant)
        ])
    }
    
    // MARK: - Set Buttons
    func setButtons() {
        ExperienceViews.cSharpButton.translatesAutoresizingMaskIntoConstraints = false
        ExperienceViews.cSharpButton.isUserInteractionEnabled = true
        ExperienceViews.cSharpButton.setTitle("C#", for: .normal)
        ExperienceViews.cSharpButton.setTitleColor(.white, for: .normal)
        ExperienceViews.cSharpButton.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        ExperienceViews.cSharpButton.titleLabel?.font = UIFont.systemFont(ofSize: ExperienceConstants.lenguagesButtonsFontSize)
        ExperienceViews.cSharpButton.layer.cornerRadius = ExperienceConstants.lenguagesButtonsCornerRadius
        ExperienceViews.cSharpButton.addTarget(self, action: #selector(cSharpBtnPressed), for: .touchUpInside)
        
        ExperienceViews.swiftButton.translatesAutoresizingMaskIntoConstraints = false
        ExperienceViews.swiftButton.setTitle("Swift", for: .normal)
        ExperienceViews.swiftButton.setTitleColor(.white, for: .normal)
        ExperienceViews.swiftButton.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        ExperienceViews.swiftButton.titleLabel?.font = UIFont.systemFont(ofSize: ExperienceConstants.lenguagesButtonsFontSize)
        ExperienceViews.swiftButton.layer.cornerRadius = ExperienceConstants.lenguagesButtonsCornerRadius
        ExperienceViews.swiftButton.addTarget(self, action: #selector(swiftBtnPressed), for: .touchUpInside)
        
        ExperienceViews.cButton.translatesAutoresizingMaskIntoConstraints = false
        ExperienceViews.cButton.setTitle("C", for: .normal)
        ExperienceViews.cButton.setTitleColor(.white, for: .normal)
        ExperienceViews.cButton.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        ExperienceViews.cButton.titleLabel?.font = UIFont.systemFont(ofSize: ExperienceConstants.lenguagesButtonsFontSize)
        ExperienceViews.cButton.layer.cornerRadius = ExperienceConstants.lenguagesButtonsCornerRadius
        ExperienceViews.cButton.addTarget(self, action: #selector(cBtnPressed), for: .touchUpInside)
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
