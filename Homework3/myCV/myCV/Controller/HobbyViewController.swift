//
//  HobbyViewController.swift
//  myCV
//
//  Created by Sergey Golovin on 13.11.2021.
//

import UIKit

final class HobbyViewController: UIViewController {
    //MARK: - Views
    private let titleLabel = UILabel()
    private let hobbyTextView = UITextView()
    private let hobbyImageView = UIImageView()
    
    
    //MARK: - Constants
    private enum HobbyConstants {
        static let startSelectedSegmentIndex = 0
        
        static let titleLabelFontSize: CGFloat = 25
        static let titleLabelTopAnchorConstant: CGFloat = 10
        
        static let hobbyTextViewFontSize: CGFloat = 20
        static let hobbyTextViewTopAnchorConstant: CGFloat = 20
        static let hobbyTextViewLeadingConstant: CGFloat = 10
        static let hobbyTextViewTrailingConstant: CGFloat = -10
        static let hobbyTextViewHeightAnchorConstant: CGFloat = 250
        
        static let segmentedControlLeadingConstant: CGFloat = 10
        static let segmentedControlTrailingConstant: CGFloat = -10
        
        static let hobbyImageViewCornerRadiusDivider: CGFloat = 2
        static let hobbyImageViewWidthConstant: CGFloat = 250
        static let hobbyImageViewHeightConstant: CGFloat = 250
        static let hobbyTextViewTopConstant: CGFloat = 10
    }

    private let userProfile = UserProfile()
    
    private var segmentedControl = UISegmentedControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setAllViews()
        segmentedControl.selectedSegmentIndex = HobbyConstants.startSelectedSegmentIndex
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
        titleLabel.textAlignment = .center
        titleLabel.text = "Хобби"
        view.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: HobbyConstants.titleLabelTopAnchorConstant)
        ])
    }
    
    // MARK: - Set ExperienceTextView
    func setExperienceTextView() {
        hobbyTextView.translatesAutoresizingMaskIntoConstraints = false
        hobbyTextView.font = UIFont.systemFont(ofSize: HobbyConstants.hobbyTextViewFontSize)
        hobbyTextView.text = userProfile.hobby
        view.addSubview(hobbyTextView)
        
        NSLayoutConstraint.activate([
            hobbyTextView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: HobbyConstants.hobbyTextViewTopAnchorConstant),
            hobbyTextView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: HobbyConstants.hobbyTextViewLeadingConstant),
            hobbyTextView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: HobbyConstants.hobbyTextViewTrailingConstant),
            hobbyTextView.heightAnchor.constraint(equalToConstant: HobbyConstants.hobbyTextViewHeightAnchorConstant)
        ])
    }
    
    // MARK: - Set SegmentedControl
    func setSegmentedControl()  {
        let items = ["Coding", "Powerlifting", "Snowboarding"]
        segmentedControl = UISegmentedControl(items: items)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.selectedSegmentIndex = HobbyConstants.startSelectedSegmentIndex
        segmentedControl.addTarget(self, action: #selector(handleSegmentedControl(_:)), for: .valueChanged)
        view.addSubview(segmentedControl)
        
        NSLayoutConstraint.activate([
            segmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            segmentedControl.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            segmentedControl.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: HobbyConstants.segmentedControlLeadingConstant),
            segmentedControl.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: HobbyConstants.segmentedControlTrailingConstant),
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
        hobbyImageView.layer.cornerRadius = hobbyImageView.bounds.width / HobbyConstants.hobbyImageViewCornerRadiusDivider
        hobbyImageView.image = UIImage(named: "swiftbird")
        hobbyImageView.clipsToBounds = true
        hobbyImageView.contentMode = .scaleAspectFit
        view.addSubview(hobbyImageView)
        
        NSLayoutConstraint.activate([
            hobbyImageView.widthAnchor.constraint(equalToConstant: HobbyConstants.hobbyImageViewWidthConstant),
            hobbyImageView.heightAnchor.constraint(equalToConstant: HobbyConstants.hobbyImageViewHeightConstant),
            hobbyImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            hobbyImageView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: HobbyConstants.hobbyTextViewTopConstant)
        ])
    }
}

