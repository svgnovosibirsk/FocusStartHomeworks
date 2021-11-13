//
//  HobbyViewController.swift
//  myCV
//
//  Created by Sergey Golovin on 13.11.2021.
//

import UIKit

class HobbyViewController: UIViewController {
    //MARK: - Views
    let titleLabel = UILabel()
    let hobbyTextView = UITextView()
    let hobbyImageView = UIImageView()
    
    var segmentedControl = UISegmentedControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setAllViews()
        segmentedControl.selectedSegmentIndex = 0
    }
}

extension HobbyViewController {
    private func setAllViews() {
        setTitleLabel()
        setExperienceTextView()
        setSegmentedControl()
        setHobbyImageView()
    }
    
    // MARK: - Set TitleLabel
    private func setTitleLabel() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.systemFont(ofSize: 25)
        titleLabel.textAlignment = .center
        titleLabel.text = "Хобби"
        view.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10)
        ])
    }
    
    // MARK: - Set ExperienceTextView
    private func setExperienceTextView() {
        hobbyTextView.translatesAutoresizingMaskIntoConstraints = false
        hobbyTextView.font = UIFont.systemFont(ofSize: 20)
        hobbyTextView.text = UserProfile.instance.hobby
        view.addSubview(hobbyTextView)
        
        NSLayoutConstraint.activate([
            hobbyTextView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            hobbyTextView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            hobbyTextView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            hobbyTextView.heightAnchor.constraint(equalToConstant: 250)
        ])
    }
    
    // MARK: - Set SegmentedControl
    private func setSegmentedControl()  {
        let items = ["Coding", "Powerlifting", "Snowboarding"]
        segmentedControl = UISegmentedControl(items: items)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(handleSegmentedControl(_:)), for: .valueChanged)
        segmentedControl.selectedSegmentIndex = 1
        view.addSubview(segmentedControl)
        
        NSLayoutConstraint.activate([
            segmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            segmentedControl.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            segmentedControl.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            segmentedControl.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
        ])
    }
    
    @objc func handleSegmentedControl(_ segmentedControl: UISegmentedControl) {
        switch (segmentedControl.selectedSegmentIndex) {
        case 0:
            hobbyImageView.image = UIImage(named: "swiftbird")
        case 1:
            hobbyImageView.image = UIImage(named: "barbell")
        case 2:
            hobbyImageView.image = UIImage(named: "snowboard")
        default:
            break
        }
    }
    
    // MARK: - Set HobbyImageView
    private func setHobbyImageView() {
        hobbyImageView.translatesAutoresizingMaskIntoConstraints = false
        hobbyImageView.layer.cornerRadius = hobbyImageView.bounds.width / 2
        hobbyImageView.image = UIImage(named: "swiftbird")
        hobbyImageView.clipsToBounds = true
        hobbyImageView.contentMode = .scaleAspectFit
        view.addSubview(hobbyImageView)
        
        NSLayoutConstraint.activate([
            hobbyImageView.widthAnchor.constraint(equalToConstant: 250),
            hobbyImageView.heightAnchor.constraint(equalToConstant: 250),
            hobbyImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            hobbyImageView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 10)
        ])
    }
}

