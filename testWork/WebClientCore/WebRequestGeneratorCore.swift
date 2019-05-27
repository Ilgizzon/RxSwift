//
//  WebRequestGeneratorCore.swift
//  testWork
//
//  Created by Ильгиз Фазлыев on 27.06.2018.
//  Copyright © 2018 Ilgizzon. All rights reserved.
//

import Foundation
final class WebRequestGeneratorCore: WebRequestGeneratorCoreI {
    func loadNew() -> WebClientRequestModel {
        let result = WebClientRequestModel(methodType: .get, httpResurcePath: Constants.Urls.GET_MY_MONEY_URL)
        return result
    }
    
}
