//
//  NewsViewModel.swift
//  HW2
//
//  Created by Andrey Grechko on 08.12.2022.
//

import Foundation
import UIKit

final class NewsViewModel {
    let title: String
    let description: String
    let imageURL: URL?
    var imageData: Data?
    
    
    init(title: String, description: String, imageURL: URL?) {
        self.title = title
        self.description = description
        self.imageURL = imageURL
    }
}
