//
//  FirstViewController.swift
//  PictureLoader
//
//  Created by Sergey Golovin on 12.12.2021.
//

import UIKit

class FirstViewController: UIViewController {
    // MARK: - Properties
    private var firstView: FirstView?
    private var firstModel: FirstModel?
    
    var images = [UIImage]()
    
    // MARK: - Initialization
    init() {
        firstView = FirstView(frame: UIScreen.main.bounds)
        firstModel = FirstModel()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    override func loadView() {
        super.loadView()
        firstView?.loadView(controller: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstModel?.onProgressChanged = self.modelProgressChanged
        firstModel?.completionHandler = self.updateImages
    }
    
    override func viewDidAppear(_ animated: Bool) {
        firstView?.configureView()
        if let firstView = firstView {
            self.view.addSubview(firstView)
        }
    }
    
    // MARK: - Methods
    func getImage(for url: String) {
        firstModel?.fetchImageData(for: url)
    }
}

    // MARK: - Private Methods
private extension FirstViewController {
    private func modelProgressChanged(progress: Float) {
        DispatchQueue.main.async {
            self.firstView?.updateProgress(with: progress)
        }
    }
    
    private func updateImages(result: (Result<UIImage, Error>)) {
        switch result {
        case .success(let image):
            DispatchQueue.main.async {[weak self] in
                self?.images.append(image)
                self?.firstView?.update()
            }
        case .failure(let error):
            DispatchQueue.main.async {[weak self] in
                print("ERROR: \(error.localizedDescription)")
                self?.showError(with: "Please enter a corect URL and try again.")
            }
        }
    }
    
    private func showError(with message: String) {
        let ac = UIAlertController(title: "ERROR", message: message, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(ac, animated: true)
    }
}
