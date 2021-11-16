//
//  MainInfoViewController.swift
//  myCV
//
//  Created by Sergey Golovin on 13.11.2021.
//

import UIKit

final class MainInfoViewController: UIViewController {
    //MARK: - Views
    let photoView = UIImageView()
    let fullNameLabel =  UILabel()
    let ageLabel = UILabel()
    let cityLabel = UILabel()
    let universityLabel = UILabel()
    let triangleView = UIImageView()
    let circleView = UIImageView()
    let squareView = UIImageView()
    
    //MARK: - Constants
    
    let figureSize: CGFloat = 100
    
    let photoSize: CGFloat = UIScreen.main.bounds.height * 0.25
    let photoCornerRadius: CGFloat = 10
    let photoViewTopConstant: CGFloat = 50
    let photoViewCornerRadiusDivider: CGFloat =  2
    let photoViewBorderWidthWhenTapped: CGFloat = 1
    let photoViewBorderWidth: CGFloat = 0
    let photoViewAnimationDelay: TimeInterval = 2
    let photoViewCornerRadius: CGFloat = 10
    
    let fullNameLabelFontSize: CGFloat = 25
    let fullNameLabelTopConstant: CGFloat = 20
    let fullNameLabelLeadingConstant: CGFloat = 50
    let fullNameLabelTrailingConstant: CGFloat = -50
    
    let ageLabelFontSize: CGFloat = 20
    let ageLabelTopConstant: CGFloat = 10
    
    let cityLabelFontSize: CGFloat = 20
    let cityLabelTopConstant: CGFloat = 10
    
    let universityLabelFontSize: CGFloat = 22
    let universityLabelNumberOfLines = 0
    let universityLabelLeadingConstant: CGFloat = 10
    let universityLabelTrailingConstant: CGFloat = -10
    let universityLabelTopConstant: CGFloat = 20
    
    let triangleSize: CGFloat = 120
    let triangleViewLeadingConstant: CGFloat = 30
    let triangleViewBottomConstant: CGFloat = -40
    let triangleAlphaWhenTapped: CGFloat = 0.2
    let triangleAlpha: CGFloat = 1
    let triangleTapAnimationDelay: TimeInterval = 1
    
    let circleViewBottomConstant: CGFloat = -50
    let circleViewScaleWhenTapped: CGFloat = 1.3
    let circleViewTapAnimationDelay: TimeInterval = 0.5
    
    let squareViewTrailingConstant: CGFloat = -30
    let squareViewBottomConstant: CGFloat = -50
    let squareViewRotationAngleDivider: CGFloat = 2
    let squareViewTapAnimationDelay: TimeInterval = 1
    
    let animationDiration: TimeInterval = 1
    
    
    
    let userProfile = UserProfile()
    
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
        photoView.layer.cornerRadius = photoCornerRadius
        photoView.image = UIImage(named: userProfile.photoName)
        photoView.clipsToBounds = true
        photoView.contentMode = .scaleAspectFit
        photoView.isUserInteractionEnabled = true
        view.addSubview(photoView)
        
        NSLayoutConstraint.activate([
            photoView.widthAnchor.constraint(equalToConstant: photoSize),
            photoView.heightAnchor.constraint(equalToConstant: photoSize),
            photoView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            photoView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: photoViewTopConstant)
        ])
    }
    
    // MARK: - Set FullNameLabel
    func setFullNameLabel() {
        fullNameLabel.translatesAutoresizingMaskIntoConstraints = false
        fullNameLabel.font = UIFont.systemFont(ofSize: fullNameLabelFontSize)
        fullNameLabel.textAlignment = .center
        let fullName = userProfile.lastName + " " + userProfile.name
        fullNameLabel.text = fullName
        view.addSubview(fullNameLabel)
        
        NSLayoutConstraint.activate([
            fullNameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: fullNameLabelLeadingConstant),
            fullNameLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: fullNameLabelTrailingConstant),
            fullNameLabel.topAnchor.constraint(equalTo: photoView.bottomAnchor, constant: fullNameLabelTopConstant)
        ])
    }
    
    // MARK: - Set AgeLabel
    func setAgeLabel() {
        ageLabel.translatesAutoresizingMaskIntoConstraints = false
        ageLabel.font = UIFont.systemFont(ofSize: ageLabelFontSize)
        ageLabel.textAlignment = .center
        ageLabel.text = "\(userProfile.age) лет"
        view.addSubview(ageLabel)
        
        NSLayoutConstraint.activate([
            ageLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ageLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: ageLabelTopConstant)
        ])
    }
    
    // MARK: - Set CityLabel
    func setCityLabel() {
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        cityLabel.font = UIFont.systemFont(ofSize: cityLabelFontSize)
        cityLabel.textAlignment = .center
        cityLabel.text = userProfile.city
        view.addSubview(cityLabel)
        
        NSLayoutConstraint.activate([
            cityLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cityLabel.topAnchor.constraint(equalTo: ageLabel.bottomAnchor, constant: cityLabelTopConstant)
        ])
    }
    
    // MARK: - Set UniversityLabel
    func setUniversityLabel() {
        universityLabel.translatesAutoresizingMaskIntoConstraints = false
        universityLabel.font = UIFont.systemFont(ofSize: universityLabelFontSize)
        universityLabel.textAlignment = .center
        universityLabel.numberOfLines = universityLabelNumberOfLines
        universityLabel.text = userProfile.university
        view.addSubview(universityLabel)
        
        NSLayoutConstraint.activate([
            universityLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: universityLabelLeadingConstant),
            universityLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: universityLabelTrailingConstant),
            universityLabel.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: universityLabelTopConstant)
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
            triangleView.widthAnchor.constraint(equalToConstant: triangleSize),
            triangleView.heightAnchor.constraint(equalToConstant: triangleSize),
            triangleView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: triangleViewLeadingConstant),
            triangleView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: triangleViewBottomConstant)
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
            circleView.widthAnchor.constraint(equalToConstant: figureSize),
            circleView.heightAnchor.constraint(equalToConstant: figureSize),
            circleView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            circleView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: circleViewBottomConstant)
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
            squareView.widthAnchor.constraint(equalToConstant: figureSize),
            squareView.heightAnchor.constraint(equalToConstant: figureSize),
            squareView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: squareViewTrailingConstant),
            squareView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: squareViewBottomConstant)
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
        UIView.animate(withDuration: animationDiration) {
            self.photoView.layer.cornerRadius = self.photoView.bounds.width / self.photoViewCornerRadiusDivider
            self.photoView.layer.borderWidth = self.photoViewBorderWidthWhenTapped
            self.photoView.layer.borderColor = UIColor.lightGray.cgColor
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + photoViewAnimationDelay) {
            UIView.animate(withDuration: self.animationDiration) {
                self.photoView.layer.borderWidth = self.photoViewBorderWidth
                self.photoView.layer.cornerRadius = self.photoViewCornerRadius
            }
        }
    }
    
    // MARK: - Set Tap Gesture Recognizer To Triangle
    func setTapGestureRecognizerToTriangle() {
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(handleTriangleTap(_:)))
        triangleView.addGestureRecognizer(tapGR)
    }

    @objc func handleTriangleTap(_ gesture: UITapGestureRecognizer) {
        UIView.animate(withDuration: animationDiration) {
            self.triangleView.alpha = self.triangleAlphaWhenTapped
           
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + triangleTapAnimationDelay) {
            UIView.animate(withDuration: self.animationDiration) {
                self.triangleView.alpha = self.triangleAlpha
            }
        }
    }
    
    // MARK: - Set Tap Gesture Recognizer To Circle
    func setTapGestureRecognizerToCircle() {
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(handleCircleTap(_:)))
        circleView.addGestureRecognizer(tapGR)
    }

    @objc func handleCircleTap(_ gesture: UITapGestureRecognizer) {
        UIView.animate(withDuration: animationDiration) {
            self.circleView.transform = CGAffineTransform(scaleX: self.circleViewScaleWhenTapped, y: self.circleViewScaleWhenTapped)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + circleViewTapAnimationDelay) {
            UIView.animate(withDuration: self.animationDiration) {
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
        UIView.animate(withDuration: animationDiration) {
            self.squareView.transform = CGAffineTransform(rotationAngle: CGFloat.pi / self.squareViewRotationAngleDivider)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + squareViewTapAnimationDelay) {
            UIView.animate(withDuration: self.animationDiration) {
                self.squareView.transform = .identity
            }
        }
    }
}
