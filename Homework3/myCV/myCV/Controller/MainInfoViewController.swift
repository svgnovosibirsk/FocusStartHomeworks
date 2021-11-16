//
//  MainInfoViewController.swift
//  myCV
//
//  Created by Sergey Golovin on 13.11.2021.
//

import UIKit

final class MainInfoViewController: UIViewController {
    //MARK: - Views
    private enum MainInfoViews {
        static let photoView = UIImageView()
        static let fullNameLabel =  UILabel()
        static let ageLabel = UILabel()
        static let cityLabel = UILabel()
        static let universityLabel = UILabel()
        static let triangleView = UIImageView()
        static let circleView = UIImageView()
        static let squareView = UIImageView()
    }
    
    //MARK: - Constants
    private enum MainInfoConstants {
        static let figureSize: CGFloat = 100
        
        static let photoSize: CGFloat = UIScreen.main.bounds.height * 0.25
        static let photoCornerRadius: CGFloat = 10
        static let photoViewTopConstant: CGFloat = 50
        static let photoViewCornerRadiusDivider: CGFloat =  2
        static let photoViewBorderWidthWhenTapped: CGFloat = 1
        static let photoViewBorderWidth: CGFloat = 0
        static let photoViewAnimationDelay: TimeInterval = 2
        static let photoViewCornerRadius: CGFloat = 10
        
        static let fullNameLabelFontSize: CGFloat = 25
        static let fullNameLabelTopConstant: CGFloat = 20
        static let fullNameLabelLeadingConstant: CGFloat = 50
        static let fullNameLabelTrailingConstant: CGFloat = -50
        
        static let ageLabelFontSize: CGFloat = 20
        static let ageLabelTopConstant: CGFloat = 10
        
        static let cityLabelFontSize: CGFloat = 20
        static let cityLabelTopConstant: CGFloat = 10
        
        static let universityLabelFontSize: CGFloat = 22
        static let universityLabelNumberOfLines = 0
        static let universityLabelLeadingConstant: CGFloat = 10
        static let universityLabelTrailingConstant: CGFloat = -10
        static let universityLabelTopConstant: CGFloat = 20
        
        static let triangleSize: CGFloat = 120
        static let triangleViewLeadingConstant: CGFloat = 30
        static let triangleViewBottomConstant: CGFloat = -40
        static let triangleAlphaWhenTapped: CGFloat = 0.2
        static let triangleAlpha: CGFloat = 1
        static let triangleTapAnimationDelay: TimeInterval = 1
        
        static let circleViewBottomConstant: CGFloat = -50
        static let circleViewScaleWhenTapped: CGFloat = 1.3
        static let circleViewTapAnimationDelay: TimeInterval = 0.5
        
        static let squareViewTrailingConstant: CGFloat = -30
        static let squareViewBottomConstant: CGFloat = -50
        static let squareViewRotationAngleDivider: CGFloat = 2
        static let squareViewTapAnimationDelay: TimeInterval = 1
        
        static let animationDiration: TimeInterval = 1
    }
    
    private let userProfile = UserProfile()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setAllViews()
        setAllGestures()
    }
}

private extension MainInfoViewController {
    
    func setAllViews() {
        setPhoto()
        setFullNameLabel()
        setAgeLabel()
        setCityLabel()
        setUniversityLabel()
        setTriangle()
        setCircle()
        setSquare()
    }
    
    func setAllGestures() {
        setTapGestureRecognizerToPhoto()
        setTapGestureRecognizerToTriangle()
        setTapGestureRecognizerToCircle()
        setTapGestureRecognizerToSquare()
    }
    
    // MARK: - Set PhotoView
    func setPhoto() {
        MainInfoViews.photoView.translatesAutoresizingMaskIntoConstraints = false
        MainInfoViews.photoView.layer.cornerRadius = MainInfoConstants.photoViewCornerRadius
        MainInfoViews.photoView.image = UIImage(named: userProfile.photoName)
        MainInfoViews.photoView.contentMode = .scaleAspectFit
        MainInfoViews.photoView.clipsToBounds = true
        MainInfoViews.photoView.isUserInteractionEnabled = true
        view.addSubview(MainInfoViews.photoView)
        
        NSLayoutConstraint.activate([
            MainInfoViews.photoView.widthAnchor.constraint(equalToConstant: MainInfoConstants.photoSize),
            MainInfoViews.photoView.heightAnchor.constraint(equalToConstant: MainInfoConstants.photoSize),
            MainInfoViews.photoView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            MainInfoViews.photoView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: MainInfoConstants.photoViewTopConstant)
        ])
    }
    
    // MARK: - Set FullNameLabel
    func setFullNameLabel() {
        MainInfoViews.fullNameLabel.translatesAutoresizingMaskIntoConstraints = false
        MainInfoViews.fullNameLabel.font = UIFont.systemFont(ofSize: MainInfoConstants.fullNameLabelFontSize)
        MainInfoViews.fullNameLabel.textAlignment = .center
        let fullName = userProfile.lastName + " " + userProfile.name
        MainInfoViews.fullNameLabel.text = fullName
        view.addSubview(MainInfoViews.fullNameLabel)
        
        NSLayoutConstraint.activate([
            MainInfoViews.fullNameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: MainInfoConstants.fullNameLabelLeadingConstant),
            MainInfoViews.fullNameLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: MainInfoConstants.fullNameLabelTrailingConstant),
            MainInfoViews.fullNameLabel.topAnchor.constraint(equalTo: MainInfoViews.photoView.bottomAnchor, constant: MainInfoConstants.fullNameLabelTopConstant)
        ])
    }
    
    // MARK: - Set AgeLabel
    func setAgeLabel() {
        MainInfoViews.ageLabel.translatesAutoresizingMaskIntoConstraints = false
        MainInfoViews.ageLabel.font = UIFont.systemFont(ofSize: MainInfoConstants.ageLabelFontSize)
        MainInfoViews.ageLabel.textAlignment = .center
        MainInfoViews.ageLabel.text = "\(userProfile.age) лет"
        view.addSubview(MainInfoViews.ageLabel)
        
        NSLayoutConstraint.activate([
            MainInfoViews.ageLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            MainInfoViews.ageLabel.topAnchor.constraint(equalTo: MainInfoViews.fullNameLabel.bottomAnchor, constant: MainInfoConstants.ageLabelTopConstant)
        ])
    }
    
    // MARK: - Set CityLabel
    func setCityLabel() {
        MainInfoViews.cityLabel.translatesAutoresizingMaskIntoConstraints = false
        MainInfoViews.cityLabel.font = UIFont.systemFont(ofSize: MainInfoConstants.cityLabelFontSize)
        MainInfoViews.cityLabel.textAlignment = .center
        MainInfoViews.cityLabel.text = userProfile.city
        view.addSubview(MainInfoViews.cityLabel)
        
        NSLayoutConstraint.activate([
            MainInfoViews.cityLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            MainInfoViews.cityLabel.topAnchor.constraint(equalTo: MainInfoViews.ageLabel.bottomAnchor, constant: MainInfoConstants.cityLabelTopConstant)
        ])
    }
    
    // MARK: - Set UniversityLabel
    func setUniversityLabel() {
        MainInfoViews.universityLabel.translatesAutoresizingMaskIntoConstraints = false
        MainInfoViews.universityLabel.font = UIFont.systemFont(ofSize: MainInfoConstants.universityLabelFontSize)
        MainInfoViews.universityLabel.textAlignment = .center
        MainInfoViews.universityLabel.numberOfLines = MainInfoConstants.universityLabelNumberOfLines
        MainInfoViews.universityLabel.text = userProfile.university
        view.addSubview(MainInfoViews.universityLabel)
        
        NSLayoutConstraint.activate([
            MainInfoViews.universityLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: MainInfoConstants.universityLabelLeadingConstant),
            MainInfoViews.universityLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: MainInfoConstants.universityLabelTrailingConstant),
            MainInfoViews.universityLabel.topAnchor.constraint(equalTo: MainInfoViews.cityLabel.bottomAnchor, constant: MainInfoConstants.universityLabelTopConstant)
        ])
    }
    
    // MARK: - Set Triangle
    func setTriangle() {
        MainInfoViews.triangleView.translatesAutoresizingMaskIntoConstraints = false
        MainInfoViews.triangleView.image = UIImage(named: "triangle")
        MainInfoViews.triangleView.clipsToBounds = true
        MainInfoViews.triangleView.contentMode = .scaleAspectFit
        MainInfoViews.triangleView.isUserInteractionEnabled = true
        view.addSubview(MainInfoViews.triangleView)
        
        NSLayoutConstraint.activate([
            MainInfoViews.triangleView.widthAnchor.constraint(equalToConstant: MainInfoConstants.triangleSize),
            MainInfoViews.triangleView.heightAnchor.constraint(equalToConstant: MainInfoConstants.triangleSize),
            MainInfoViews.triangleView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: MainInfoConstants.triangleViewLeadingConstant),
            MainInfoViews.triangleView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: MainInfoConstants.triangleViewBottomConstant)
        ])
    }
    
    // MARK: - Set Circle
    func setCircle() {
        MainInfoViews.circleView.translatesAutoresizingMaskIntoConstraints = false
        MainInfoViews.circleView.image = UIImage(named: "circle")
        MainInfoViews.circleView.clipsToBounds = true
        MainInfoViews.circleView.contentMode = .scaleAspectFit
        MainInfoViews.circleView.isUserInteractionEnabled = true
        view.addSubview(MainInfoViews.circleView)
        
        NSLayoutConstraint.activate([
            MainInfoViews.circleView.widthAnchor.constraint(equalToConstant: MainInfoConstants.figureSize),
            MainInfoViews.circleView.heightAnchor.constraint(equalToConstant: MainInfoConstants.figureSize),
            MainInfoViews.circleView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            MainInfoViews.circleView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: MainInfoConstants.circleViewBottomConstant)
        ])
    }
    
    // MARK: - Set Square
    func setSquare() {
        MainInfoViews.squareView.translatesAutoresizingMaskIntoConstraints = false
        MainInfoViews.squareView.image = UIImage(named: "square")
        MainInfoViews.squareView.clipsToBounds = true
        MainInfoViews.squareView.contentMode = .scaleAspectFit
        MainInfoViews.squareView.isUserInteractionEnabled = true
        view.addSubview(MainInfoViews.squareView)
        
        NSLayoutConstraint.activate([
            MainInfoViews.squareView.widthAnchor.constraint(equalToConstant: MainInfoConstants.figureSize),
            MainInfoViews.squareView.heightAnchor.constraint(equalToConstant: MainInfoConstants.figureSize),
            MainInfoViews.squareView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: MainInfoConstants.squareViewTrailingConstant),
            MainInfoViews.squareView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: MainInfoConstants.squareViewBottomConstant)
        ])
    }
}

private extension MainInfoViewController {
    // MARK: - Set Tap Gesture Recognizer To Photo
    func setTapGestureRecognizerToPhoto() {
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        MainInfoViews.photoView.addGestureRecognizer(tapGR)
    }

    @objc func handleTap(_ gesture: UITapGestureRecognizer) {
        UIView.animate(withDuration: MainInfoConstants.animationDiration) {
            MainInfoViews.photoView.layer.cornerRadius = MainInfoViews.photoView.bounds.width / MainInfoConstants.photoViewCornerRadiusDivider
            MainInfoViews.photoView.layer.borderWidth = MainInfoConstants.photoViewBorderWidthWhenTapped
            MainInfoViews.photoView.layer.borderColor = UIColor.lightGray.cgColor
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + MainInfoConstants.photoViewAnimationDelay) {
            UIView.animate(withDuration: MainInfoConstants.animationDiration) {
                MainInfoViews.photoView.layer.borderWidth = MainInfoConstants.photoViewBorderWidth
                MainInfoViews.photoView.layer.cornerRadius = MainInfoConstants.photoViewCornerRadius
            }
        }
    }
    
    // MARK: - Set Tap Gesture Recognizer To Triangle
    func setTapGestureRecognizerToTriangle() {
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(handleTriangleTap(_:)))
        MainInfoViews.triangleView.addGestureRecognizer(tapGR)
    }

    @objc func handleTriangleTap(_ gesture: UITapGestureRecognizer) {
        UIView.animate(withDuration: MainInfoConstants.animationDiration) {
            MainInfoViews.triangleView.alpha = MainInfoConstants.triangleAlphaWhenTapped
           
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + MainInfoConstants.triangleTapAnimationDelay) {
            UIView.animate(withDuration: MainInfoConstants.animationDiration) {
                MainInfoViews.triangleView.alpha = MainInfoConstants.triangleAlpha
            }
        }
    }
    
    // MARK: - Set Tap Gesture Recognizer To Circle
    func setTapGestureRecognizerToCircle() {
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(handleCircleTap(_:)))
        MainInfoViews.circleView.addGestureRecognizer(tapGR)
    }

    @objc func handleCircleTap(_ gesture: UITapGestureRecognizer) {
        UIView.animate(withDuration: MainInfoConstants.animationDiration) {
            MainInfoViews.circleView.transform = CGAffineTransform(scaleX: MainInfoConstants.circleViewScaleWhenTapped, y: MainInfoConstants.circleViewScaleWhenTapped)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + MainInfoConstants.circleViewTapAnimationDelay) {
            UIView.animate(withDuration: MainInfoConstants.animationDiration) {
                MainInfoViews.circleView.transform = .identity
            }
        }
    }
    
    // MARK: - Set Tap Gesture Recognizer To Square
    func setTapGestureRecognizerToSquare() {
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(handleSquareTap(_:)))
        MainInfoViews.squareView.addGestureRecognizer(tapGR)
    }

    @objc func handleSquareTap(_ gesture: UITapGestureRecognizer) {
        UIView.animate(withDuration: MainInfoConstants.animationDiration) {
            MainInfoViews.squareView.transform = CGAffineTransform(rotationAngle: CGFloat.pi / MainInfoConstants.squareViewRotationAngleDivider)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + MainInfoConstants.squareViewTapAnimationDelay) {
            UIView.animate(withDuration: MainInfoConstants.animationDiration) {
                MainInfoViews.squareView.transform = .identity
            }
        }
    }
}
