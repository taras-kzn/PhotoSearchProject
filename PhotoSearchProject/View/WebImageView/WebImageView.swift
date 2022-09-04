//
//  WebImageView.swift
//  PhotoSearchProject
//
//  Created by Denis Tarasov on 04.09.2022.
//

import Foundation
import UIKit

class WebImageView: UIImageView {

    private var currentUrlString: String?

    func set(imageUrl: String?) {

        currentUrlString = imageUrl
        guard let imageUrl = imageUrl, let url = URL(string: imageUrl) else { return }

        if let cachedResponse = URLCache.shared.cachedResponse(for: URLRequest(url: url)) {
            self.image = UIImage(data: cachedResponse.data)
            return
        }

        let dataTask = URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            DispatchQueue.main.async {
                if let data = data, let response = response {
                    self?.handleLoaderImage(data: data, response: response)
                }
            }
        }
        dataTask.resume()
    }

    private func handleLoaderImage(data: Data, response: URLResponse) {
        guard let responseUrl = response.url else { return }
        let cashedResponse = CachedURLResponse(response: response, data: data)
        URLCache.shared.storeCachedResponse(cashedResponse, for: URLRequest(url: responseUrl))

        if responseUrl.absoluteString == currentUrlString {
            self.image = UIImage(data: data)
        }
    }
}
