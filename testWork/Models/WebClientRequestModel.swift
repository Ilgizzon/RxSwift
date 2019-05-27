//
//  WebClientHTTPMethod.swift
//  testWork
//
//  Created by Ильгиз Фазлыев on 27.06.2018.
//  Copyright © 2018 Ilgizzon. All rights reserved.
//

import Foundation
enum WebClientHTTPMethod: String {
    case get = "GET"
}

struct WebClientRequestModel {
    let methodType: WebClientHTTPMethod
    let httpResurcePath: String
}
