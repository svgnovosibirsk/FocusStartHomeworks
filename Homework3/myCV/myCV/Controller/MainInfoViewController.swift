//
//  MainInfoViewController.swift
//  myCV
//
//  Created by Sergey Golovin on 13.11.2021.
//

import UIKit

class MainInfoViewController: UIViewController {
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
    let photoSize: CGFloat = UIScreen.main.bounds.height * 0.25
    let figureSize: CGFloat = 100
    let triangleSize: CGFloat = 120
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setAllViews()
        setAllGestures()
    }
}

extension MainInfoViewController {
    
    private func setAllViews() {
        setPhoto()
        setFullNameLabel()
        setAgeLabel()
        setCityLabel()
        setUniversityLabel()
        setTriangle()
        setCircle()
        setSquare()
    }
    
    private func setAllGestures() {
        setTapGestureRecognizerToPhoto()
        setTapGestureRecognizerToTriangle()
        setTapGestureRecognizerToCircle()
        setTapGestureRecognizerToSquare()
    }
    
    // MARK: - Set PhotoView
    private func setPhoto() {
        photoView.translatesAutoresizingMaskIntoConstraints = false
        photoView.layer.cornerRadius = 10
        photoView.image = UIImage(named: UserProfile.instance.photoName)
        photoView.clipsToBounds = true
        photoView.contentMode = .scaleAspectFit
        photoView.isUserInteractionEnabled = true
        view.addSubview(photoView)
        
        NSLayoutConstraint.activate([
            photoView.widthAnchor.constraint(equalToConstant: photoSize),
            photoView.heightAnchor.constraint(equalToConstant: photoSize),
            photoView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            photoView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50)
        ])
    }
    
    // MARK: - Set FullNameLabel
    private func setFullNameLabel() {
        fullNameLabel.translatesAutoresizingMaskIntoConstraints = false
        fullNameLabel.font = UIFont.systemFont(ofSize: 25)
        fullNameLabel.textAlignment = .center
        let fullName = UserProfile.instance.lastName + " " + UserProfile.instance.name
        fullNameLabel.text = fullName
        view.addSubview(fullNameLabel)
        
        NSLayoutConstraint.activate([
            fullNameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            fullNameLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            fullNameLabel.topAnchor.constraint(equalTo: photoView.bottomAnchor, constant: 20)
        ])
    }
    
    // MARK: - Set AgeLabel
    private func setAgeLabel() {
        ageLabel.translatesAutoresizingMaskIntoConstraints = false
        ageLabel.font = UIFont.systemFont(ofSize: 20)
        ageLabel.textAlignment = .center
        ageLabel.text = "\(UserProfile.instance.age) лет"
        view.addSubview(ageLabel)
        
        NSLayoutConstraint.activate([
            ageLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ageLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 10)
        ])
    }
    
    // MARK: - Set CityLabel
    private func setCityLabel() {
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        cityLabel.font = UIFont.systemFont(ofSize: 20)
        cityLabel.textAlignment = .center
        cityLabel.text = UserProfile.instance.city
        view.addSubview(cityLabel)
        
        NSLayoutConstraint.activate([
            cityLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cityLabel.topAnchor.constraint(equalTo: ageLabel.bottomAnchor, constant: 10)
        ])
    }
    
    // MARK: - Set UniversityLabel
    private func setUniversityLabel() {
        universityLabel.translatesAutoresizingMaskIntoConstraints = false
        universityLabel.font = UIFont.systemFont(ofSize: 22)
        universityLabel.textAlignment = .center
        universityLabel.numberOfLines = 0
        universityLabel.text = UserProfile.instance.university
        view.addSubview(universityLabel)
        
        NSLayoutConstraint.activate([
            universityLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            universityLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            universityLabel.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 20)
        ])
    }
    
    // MARK: - Set Triangle
    private func setTriangle() {
        triangleView.translatesAutoresizingMaskIntoConstraints = false
        triangleView.image = UIImage(named: "triangle")
        triangleView.clipsToBounds = true
        triangleView.contentMode = .scaleAspectFit
        triangleView.isUserInteractionEnabled = true
        view.addSubview(triangleView)
        
        NSLayoutConstraint.activate([
            triangleView.widthAnchor.constraint(equalToConstant: triangleSize),
            triangleView.heightAnchor.constraint(equalToConstant: triangleSize),
            triangleView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 30),
            triangleView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40)
        ])
    }
    
    // MARK: - Set Circle
    private func setCircle() {
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
            circleView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50)
        ])
    }
    
    // MARK: - Set Square
    private func setSquare() {
        squareView.translatesAutoresizingMaskIntoConstraints = false
        squareView.image = UIImage(named: "square")
        squareView.clipsToBounds = true
        squareView.contentMode = .scaleAspectFit
        squareView.isUserInteractionEnabled = true
        view.addSubview(squareView)
        
        NSLayoutConstraint.activate([
            squareView.widthAnchor.constraint(equalToConstant: figureSize),
            squareView.heightAnchor.constraint(equalToConstant: figureSize),
            squareView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -30),
            squareView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50)
        ])
    }
}

extension MainInfoViewController {
    // MARK: - Set Tap Gesture Recognizer To Photo
    private func setTapGestureRecognizerToPhoto() {
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        photoView.addGestureRecognizer(tapGR)
    }

    @objc private func handleTap(_ gesture: UITapGestureRecognizer) {
        UIView.animate(withDuration: 1) {
            self.photoView.layer.cornerRadius = self.photoView.bounds.width / 2
            self.photoView.layer.borderWidth = 1
            self.photoView.layer.borderColor = UIColor.lightGray.cgColor
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            UIView.animate(withDuration: 1) {
                self.photoView.layer.borderWidth = 0
                self.photoView.layer.cornerRadius = 10
            }
        }
    }
    
    // MARK: - Set Tap Gesture Recognizer To Triangle
    private func setTapGestureRecognizerToTriangle() {
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(handleTriangleTap(_:)))
        triangleView.addGestureRecognizer(tapGR)
    }

    @objc private func handleTriangleTap(_ gesture: UITapGestureRecognizer) {
        UIView.animate(withDuration: 1) {
            self.triangleView.alpha = 0.2
           
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            UIView.animate(withDuration: 1) {
                self.triangleView.alpha = 1
            }
        }
    }
    
    // MARK: - Set Tap Gesture Recognizer To Circle
    private func setTapGestureRecognizerToCircle() {
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(handleCircleTap(_:)))
        circleView.addGestureRecognizer(tapGR)
    }

    @objc private func handleCircleTap(_ gesture: UITapGestureRecognizer) {
        UIView.animate(withDuration: 1) {
            self.circleView.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)

           
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            UIView.animate(withDuration: 1) {
                self.circleView.transform = .identity
            }
        }
    }
    
    // MARK: - Set Tap Gesture Recognizer To Square
    private func setTapGestureRecognizerToSquare() {
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(handleSquareTap(_:)))
        squareView.addGestureRecognizer(tapGR)
    }

    @objc private func handleSquareTap(_ gesture: UITapGestureRecognizer) {
        UIView.animate(withDuration: 1) {
            self.squareView.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 2)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            UIView.animate(withDuration: 1) {
                self.squareView.transform = .identity
            }
        }
    }
}
