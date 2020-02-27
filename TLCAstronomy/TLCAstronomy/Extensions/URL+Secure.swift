//
//  URL+Secure.swift
//  TLCAstronomy
//
//  Created by Troy Christian on 2/25/20.
//  Copyright © 2020 Troy Christian. All rights reserved.
//


import Foundation

extension URL {
    var usingHTTPS: URL? {
        guard var components = URLComponents(url: self, resolvingAgainstBaseURL: true) else { return nil }
        components.scheme = "https"
        return components.url
    }
}
