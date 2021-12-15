//
//  FirstModel.swift
//  PictureLoader
//
//  Created by Sergey Golovin on 12.12.2021.
//

import Foundation
import UIKit

final class FirstModel: NSObject {
    // MARK: - Properties
    let testUrl = "https://picsum.photos/200" // Оставил на всякий случай для целей тестирования
    
    var onProgressChanged: ((_: Float) -> Void)? = nil
    var completionHandler: ((Result<UIImage, Error>) -> Void)? = nil
    
    var progress: Float = 0.0 {
        didSet {
            onProgressChanged?(progress)
        }
    }
    
    // MARK: - Errors
    enum fetchImageRrrors: Error {
        case urlError
        case dataError
        case imageError
    }
    
    // MARK: - Image fetching
    func fetchImageData(for stringUrl: String) {
        progress = 0.0
        
        guard let url = URL(string: stringUrl) else {
            completionHandler?(.failure(fetchImageRrrors.urlError))
            return
        }
        
        let config = URLSessionConfiguration.background(withIdentifier: "com.fetchImageData.background")
        let session = URLSession(configuration: config, delegate: self, delegateQueue: OperationQueue())
        let task = session.downloadTask(with: url)
        task.resume()
        
    }
}

    // MARK: - URLSessionDownloadDelegate
extension FirstModel: URLSessionDownloadDelegate {

    func urlSession(_ session: URLSession,
                    downloadTask: URLSessionDownloadTask,
                    didFinishDownloadingTo location: URL) {
        
        guard let data = try? Data(contentsOf: location) else {
            completionHandler?(.failure(fetchImageRrrors.dataError))
            return
        }
        
        if let imgage = UIImage(data: data) {
            completionHandler?(.success(imgage))
        } else {
            completionHandler?(.failure(fetchImageRrrors.imageError))
        }
    }
    
    func urlSession(_ session: URLSession,
                    downloadTask: URLSessionDownloadTask,
                    didWriteData bytesWritten: Int64,
                    totalBytesWritten: Int64,
                    totalBytesExpectedToWrite: Int64) {
        self.progress = Float(totalBytesWritten) / Float(totalBytesExpectedToWrite)
        
    }
    

    func urlSession(_ session: URLSession,
                    task:URLSessionTask,
                    didCompleteWithError error: Error?) {
        if let error = error {
            completionHandler?(.failure(error))
        }
    }
}
