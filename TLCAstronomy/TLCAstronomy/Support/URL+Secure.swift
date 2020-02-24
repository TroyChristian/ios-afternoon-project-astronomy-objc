//
//  URL+Secure.swift
//  TLCAstronomy
//
//  Created by Lambda_School_Loaner_219 on 2/24/20.
//  Copyright © 2020 Lambda_School_Loaner_219. All rights reserved.
//

import Foundation

​
extension URL {
    var usingHTTPS: URL? {
        guard var components = URLComponents(url: self, resolvingAgainstBaseURL: true) else { return nil }
        components.scheme = "https"
        return components.url
    }
}
