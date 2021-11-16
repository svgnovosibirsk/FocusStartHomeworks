//
//  MainInfoViewController.swift
//  myCV
//
//  Created by Sergey Golovin on 13.11.2021.
//

import UIKit

final class MainInfoViewController: UIViewController {
    //MARK: - Views
    private let photoView = UIImageView()
    private let fullNameLabel =  UILabel()
    private let ageLabel = UILabel()
    private let cityLabel = UILabel()
    private let universityLabel = UILabel()
    private let triangleView = UIImageView()
    private let circleView = UIImageView()
    private let squareView = UIImageView()

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
        photoView.translatesAutoresizingMaskIntoConstraints = false
        photoView.layer.cornerRadius = MainInfoConstants.photoViewCornerRadius
        photoView.image = UIImage(named: userProfile.photoName)
        photoView.contentMode = .scaleAspectFit
        photoView.clipsToBounds = true
        photoView.isUserInteractionEnabled = true
        view.addSubview(photoView)
        
        NSLayoutConstraint.activate([
            photoView.widthAnchor.constraint(equalToConstant: MainInfoConstants.photoSize),
            photoView.heightAnchor.constraint(equalToConstant: MainInfoConstants.photoSize),
            photoView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            photoView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: MainInfoConstants.photoViewTopConstant)
        ])
    }
    
    // MARK: - Set FullNameLabel
    func setFullNameLabel() {
        fullNameLabel.translatesAutoresizingMaskIntoConstraints = false
        fullNameLabel.font = UIFont.systemFont(ofSize: MainInfoConstants.fullNameLabelFontSize)
        fullNameLabel.textAlignment = .center
        let fullName = userProfile.lastName + " " + userProfile.name
        fullNameLabel.text = fullName
        view.addSubview(fullNameLabel)
        
        NSLayoutConstraint.activate([
            fullNameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: MainInfoConstants.fullNameLabelLeadingConstant),
            fullNameLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: MainInfoConstants.fullNameLabelTrailingConstant),
            fullNameLabel.topAnchor.constraint(equalTo: photoView.bottomAnchor, constant: MainInfoConstants.fullNameLabelTopConstant)
        ])
    }
    
    // MARK: - Set AgeLabel
    func setAgeLabel() {
        ageLabel.translatesAutoresizingMaskIntoConstraints = false
        ageLabel.font = UIFont.systemFont(ofSize: MainInfoConstants.ageLabelFontSize)
        ageLabel.textAlignment = .center
        ageLabel.text = "\(userProfile.age) лет"
        view.addSubview(ageLabel)
        
        NSLayoutConstraint.activate([
            ageLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ageLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: MainInfoConstants.ageLabelTopConstant)
        ])
    }
    
    // MARK: - Set CityLabel
    func setCityLabel() {
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        cityLabel.font = UIFont.systemFont(ofSize: MainInfoConstants.cityLabelFontSize)
        cityLabel.textAlignment = .center
        cityLabel.text = userProfile.city
        view.addSubview(cityLabel)
        
        NSLayoutConstraint.activate([
            cityLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cityLabel.topAnchor.constraint(equalTo: ageLabel.bottomAnchor, constant: MainInfoConstants.cityLabelTopConstant)
        ])
    }
    
    // MARK: - Set UniversityLabel
    func setUniversityLabel() {
        universityLabel.translatesAutoresizingMaskIntoConstraints = false
        universityLabel.font = UIFont.systemFont(ofSize: MainInfoConstants.universityLabelFontSize)
        universityLabel.textAlignment = .center
        universityLabel.numberOfLines = MainInfoConstants.universityLabelNumberOfLines
        universityLabel.text = userProfile.university
        view.addSubview(universityLabel)
        
        NSLayoutConstraint.activate([
            universityLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: MainInfoConstants.universityLabelLeadingConstant),
            universityLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: MainInfoConstants.universityLabelTrailingConstant),
            universityLabel.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: MainInfoConstants.universityLabelTopConstant)
        ])
    }
    
    // MARK: - Set Triangle
    func setTriangle() {
        triangleView.translatesAutoresizingMaskIntoConstraints = false
        triangleView.image = UIImage(named: "triangle")
        triangleView.clipsToBounds = true
        triangleView.contentMode = .scaleAspectFit
        triangleView.isUserInteractionEnabled = true
        view.addSubview(triangleView)
        
        NSLayoutConstraint.activate([
            triangleView.widthAnchor.constraint(equalToConstant: MainInfoConstants.triangleSize),
            triangleView.heightAnchor.constraint(equalToConstant: MainInfoConstants.triangleSize),
            triangleView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: MainInfoConstants.triangleViewLeadingConstant),
            triangleView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: MainInfoConstants.triangleViewBottomConstant)
        ])
    }
    
    // MARK: - Set Circle
    func setCircle() {
        circleView.translatesAutoresizingMaskIntoConstraints = false
        circleView.image = UIImage(named: "circle")
        circleView.clipsToBounds = true
        circleView.contentMode = .scaleAspectFit
        circleView.isUserInteractionEnabled = true
        view.addSubview(circleView)
        
        NSLayoutConstraint.activate([
            circleView.widthAnchor.constraint(equalToConstant: MainInfoConstants.figureSize),
            circleView.heightAnchor.constraint(equalToConstant: MainInfoConstants.figureSize),
            circleView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            circleView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: MainInfoConstants.circleViewBottomConstant)
        ])
    }
    
    // MARK: - Set Square
    func setSquare() {
        squareView.translatesAutoresizingMaskIntoConstraints = false
        squareView.image = UIImage(named: "square")
        squareView.clipsToBounds = true
        squareView.contentMode = .scaleAspectFit
        squareView.isUserInteractionEnabled = true
        view.addSubview(squareView)
        
        NSLayoutConstraint.activate([
            squareView.widthAnchor.constraint(equalToConstant: MainInfoConstants.figureSize),
            squareView.heightAnchor.constraint(equalToConstant: MainInfoConstants.figureSize),
            squareView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: MainInfoConstants.squareViewTrailingConstant),
            squareView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: MainInfoConstants.squareViewBottomConstant)
        ])
    }
}

private extension MainInfoViewController {
    // MARK: - Set Tap Gesture Recognizer To Photo
    func setTapGestureRecognizerToPhoto() {
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        photoView.addGestureRecognizer(tapGR)
    }

    @objc func handleTap(_ gesture: UITapGestureRecognizer) {
        UIView.animate(withDuration: MainInfoConstants.animationDiration) {
            self.photoView.layer.cornerRadius = self.photoView.bounds.width / MainInfoConstants.photoViewCornerRadiusDivider
            self.photoView.layer.borderWidth = MainInfoConstants.photoViewBorderWidthWhenTapped
            self.photoView.layer.borderColor = UIColor.lightGray.cgColor
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + MainInfoConstants.photoViewAnimationDelay) {
            UIView.animate(withDuration: MainInfoConstants.animationDiration) {
                self.photoView.layer.borderWidth = MainInfoConstants.photoViewBorderWidth
                self.photoView.layer.cornerRadius = MainInfoConstants.photoViewCornerRadius
            }
        }
    }
    
    // MARK: - Set Tap Gesture Recognizer To Triangle
    func setTapGestureRecognizerToTriangle() {
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(handleTriangleTap(_:)))
        triangleView.addGestureRecognizer(tapGR)
    }

    @objc func handleTriangleTap(_ gesture: UITapGestureRecognizer) {
        UIView.animate(withDuration: MainInfoConstants.animationDiration) {
            self.triangleView.alpha = MainInfoConstants.triangleAlphaWhenTapped
           
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + MainInfoConstants.triangleTapAnimationDelay) {
            UIView.animate(withDuration: MainInfoConstants.animationDiration) {
                self.triangleView.alpha = MainInfoConstants.triangleAlpha
            }
        }
    }
    
    // MARK: - Set Tap Gesture Recognizer To Circle
    func setTapGestureRecognizerToCircle() {
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(handleCircleTap(_:)))
        circleView.addGestureRecognizer(tapGR)
    }

    @objc func handleCircleTap(_ gesture: UITapGestureRecognizer) {
        UIView.animate(withDuration: MainInfoConstants.animationDiration) {
            self.circleView.transform = CGAffineTransform(scaleX: MainInfoConstants.circleViewScaleWhenTapped, y: MainInfoConstants.circleViewScaleWhenTapped)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + MainInfoConstants.circleViewTapAnimationDelay) {
            UIView.animate(withDuration: MainInfoConstants.animationDiration) {
                self.circleView.transform = .identity
            }
        }
    }
    
    // MARK: - Set Tap Gesture Recognizer To Square
    func setTapGestureRecognizerToSquare() {
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(handleSquareTap(_:)))
        squareView.addGestureRecognizer(tapGR)
    }

    @objc func handleSquareTap(_ gesture: UITapGestureRecognizer) {
        UIView.animate(withDuration: MainInfoConstants.animationDiration) {
            self.squareView.transform = CGAffineTransform(rotationAngle: CGFloat.pi / MainInfoConstants.squareViewRotationAngleDivider)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + MainInfoConstants.squareViewTapAnimationDelay) {
            UIView.animate(withDuration: MainInfoConstants.animationDiration) {
                self.squareView.transform = .identity
            }
        }
    }
}
