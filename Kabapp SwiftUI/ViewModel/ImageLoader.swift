//
//  ImageView.swift
//  Kabapp SwiftUI
//
//  Created by Christian Kabouchy on 3/31/20.
//  Copyright © 2020 Christian Kabouchy. All rights reserved.
//

import Foundation

class ImageLoader: ObservableObject {
    
    @Published var dataIsValid = false
    var data:Data?

    func loadImage (urlString:String) {
        guard let url = URL(string: urlString) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.dataIsValid = true
                self.data = data
            }
        }
        task.resume()
    }
}
