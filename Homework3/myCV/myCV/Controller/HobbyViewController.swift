//
//  HobbyViewController.swift
//  myCV
//
//  Created by Sergey Golovin on 13.11.2021.
//

import UIKit

final class HobbyViewController: UIViewController {
    //MARK: - Views
    let titleLabel = UILabel()
    let hobbyTextView = UITextView()
    let hobbyImageView = UIImageView()
    
    //MARK: - Constants
    let startSelectedSegmentIndex = 0
    
    let titleLabelFontSize: CGFloat = 25
    let titleLabelTopAnchorConstant: CGFloat = 10
    
    let hobbyTextViewFontSize: CGFloat = 20
    let hobbyTextViewTopAnchorConstant: CGFloat = 20
    let hobbyTextViewLeadingConstant: CGFloat = 10
    let hobbyTextViewTrailingConstant: CGFloat = -10
    let hobbyTextViewHeightAnchorConstant: CGFloat = 250
    
    let segmentedControlLeadingConstant: CGFloat = 10
    let segmentedControlTrailingConstant: CGFloat = -10
    
    let hobbyImageViewCornerRadiusDivider: CGFloat = 2
    let hobbyImageViewWidthConstant: CGFloat = 250
    let hobbyImageViewHeightConstant: CGFloat = 250
    let hobbyTextViewTopConstant: CGFloat = 10
    
    
    let userProfile = UserProfile()
    
    var segmentedControl = UISegmentedControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setAllViews()
        segmentedControl.selectedSegmentIndex = startSelectedSegmentIndex
    }
}

private extension HobbyViewController {
    func setAllViews() {
        setTitleLabel()
        setExperienceTextView()
        setSegmentedControl()
        setHobbyImageView()
    }
    
    // MARK: - Set TitleLabel
    func setTitleLabel() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.systemFont(ofSize: titleLabelFontSize)
        titleLabel.textAlignment = .center
        titleLabel.text = "Хобби"
        view.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: titleLabelTopAnchorConstant)
        ])
    }
    
    // MARK: - Set ExperienceTextView
    func setExperienceTextView() {
        hobbyTextView.translatesAutoresizingMaskIntoConstraints = false
        hobbyTextView.font = UIFont.systemFont(ofSize: hobbyTextViewFontSize)
        hobbyTextView.text = userProfile.hobby
        view.addSubview(hobbyTextView)
        
        NSLayoutConstraint.activate([
            hobbyTextView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: hobbyTextViewTopAnchorConstant),
            hobbyTextView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: hobbyTextViewLeadingConstant),
            hobbyTextView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: hobbyTextViewTrailingConstant),
            hobbyTextView.heightAnchor.constraint(equalToConstant: hobbyTextViewHeightAnchorConstant)
        ])
    }
    
    // MARK: - Set SegmentedControl
    func setSegmentedControl()  {
        let items = ["Coding", "Powerlifting", "Snowboarding"]
        segmentedControl = UISegmentedControl(items: items)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.selectedSegmentIndex = startSelectedSegmentIndex
        segmentedControl.addTarget(self, action: #selector(handleSegmentedControl(_:)), for: .valueChanged)
        view.addSubview(segmentedControl)
        
        NSLayoutConstraint.activate([
            segmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            segmentedControl.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            segmentedControl.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: segmentedControlLeadingConstant),
            segmentedControl.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: segmentedControlTrailingConstant),
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
    func setHobbyImageView() {
        hobbyImageView.translatesAutoresizingMaskIntoConstraints = false
        hobbyImageView.layer.cornerRadius = hobbyImageView.bounds.width / hobbyImageViewCornerRadiusDivider
        hobbyImageView.image = UIImage(named: "swiftbird")
        hobbyImageView.clipsToBounds = true
        hobbyImageView.contentMode = .scaleAspectFit
        view.addSubview(hobbyImageView)
        
        NSLayoutConstraint.activate([
            hobbyImageView.widthAnchor.constraint(equalToConstant: hobbyImageViewWidthConstant),
            hobbyImageView.heightAnchor.constraint(equalToConstant: hobbyImageViewHeightConstant),
            hobbyImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            hobbyImageView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: hobbyTextViewTopConstant)
        ])
    }
}

