//
//  HobbyViewController.swift
//  myCV
//
//  Created by Sergey Golovin on 13.11.2021.
//

import UIKit

final class HobbyViewController: UIViewController {
    //MARK: - Views
    private enum HobbyViews {
        static let titleLabel = UILabel()
        static let hobbyTextView = UITextView()
        static let hobbyImageView = UIImageView()
    }
    
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
        HobbyViews.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        HobbyViews.titleLabel.textAlignment = .center
        HobbyViews.titleLabel.text = "Хобби"
        view.addSubview(HobbyViews.titleLabel)
        
        NSLayoutConstraint.activate([
            HobbyViews.titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            HobbyViews.titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: HobbyConstants.titleLabelTopAnchorConstant)
        ])
    }
    
    // MARK: - Set ExperienceTextView
    func setExperienceTextView() {
        HobbyViews.hobbyTextView.translatesAutoresizingMaskIntoConstraints = false
        HobbyViews.hobbyTextView.font = UIFont.systemFont(ofSize: HobbyConstants.hobbyTextViewFontSize)
        HobbyViews.hobbyTextView.text = userProfile.hobby
        view.addSubview(HobbyViews.hobbyTextView)
        
        NSLayoutConstraint.activate([
            HobbyViews.hobbyTextView.topAnchor.constraint(equalTo: HobbyViews.titleLabel.bottomAnchor, constant: HobbyConstants.hobbyTextViewTopAnchorConstant),
            HobbyViews.hobbyTextView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: HobbyConstants.hobbyTextViewLeadingConstant),
            HobbyViews.hobbyTextView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: HobbyConstants.hobbyTextViewTrailingConstant),
            HobbyViews.hobbyTextView.heightAnchor.constraint(equalToConstant: HobbyConstants.hobbyTextViewHeightAnchorConstant)
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
            HobbyViews.hobbyImageView.image = UIImage(named: "swiftbird")
        case 1:
            HobbyViews.hobbyImageView.image = UIImage(named: "barbell")
        case 2:
            HobbyViews.hobbyImageView.image = UIImage(named: "snowboard")
        default:
            break
        }
    }
    
    // MARK: - Set HobbyImageView
    func setHobbyImageView() {
        HobbyViews.hobbyImageView.translatesAutoresizingMaskIntoConstraints = false
        HobbyViews.hobbyImageView.layer.cornerRadius = HobbyViews.hobbyImageView.bounds.width / HobbyConstants.hobbyImageViewCornerRadiusDivider
        HobbyViews.hobbyImageView.image = UIImage(named: "swiftbird")
        HobbyViews.hobbyImageView.clipsToBounds = true
        HobbyViews.hobbyImageView.contentMode = .scaleAspectFit
        view.addSubview(HobbyViews.hobbyImageView)
        
        NSLayoutConstraint.activate([
            HobbyViews.hobbyImageView.widthAnchor.constraint(equalToConstant: HobbyConstants.hobbyImageViewWidthConstant),
            HobbyViews.hobbyImageView.heightAnchor.constraint(equalToConstant: HobbyConstants.hobbyImageViewHeightConstant),
            HobbyViews.hobbyImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            HobbyViews.hobbyImageView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: HobbyConstants.hobbyTextViewTopConstant)
        ])
    }
}

