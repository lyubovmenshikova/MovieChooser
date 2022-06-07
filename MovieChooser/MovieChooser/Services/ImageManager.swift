//
//  ImageManager.swift
//  MovieChooser
//
//  Created by Lyubov Menshikova on 02.06.2022.
//

import Foundation

class ImageManager {
    static let shared = ImageManager()
    
    private init() {}
    
    func fetchImageData(from string: String?) -> Data? {
        guard let string = string,
              let url = URL(string: string),
              let imageData = try? Data(contentsOf: url) else { return nil }
        return imageData
    }
}

