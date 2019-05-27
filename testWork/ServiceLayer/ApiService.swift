//
//  ApiService.swift
//  testWork
//
//  Created by Ильгиз Фазлыев on 27.06.2018.
//  Copyright © 2018 Ilgizzon. All rights reserved.
//

import Foundation
import UIKit

final class ApiService {
    let webClient: WebClientCoreI
    let webRequestGenerator: WebRequestGeneratorCoreI
    let mapper: MapperCoreI
    
    init(webClient: WebClientCoreI,
         webRequestGenerator: WebRequestGeneratorCoreI,
         mapper: MapperCoreI) {
        
        self.webClient = webClient
        self.webRequestGenerator = webRequestGenerator
        self.mapper = mapper
    }
}
extension ApiService: ApiServiceI {
    func loadNew(complete: @escaping ([OneItemModel]) -> Void, failure: @escaping (WebClientError) -> Void) {
        let loadData = self.webRequestGenerator.loadNew()
        webClient.sendRequest(request: loadData, success: { responceData in
            if let response = responceData as? [String: Any] {
                if let itemModel = self.mapper.load(_itemDict: response) {
                    complete(itemModel)
                }
            }
        }) { error in
            failure(error)
        }
        
    }
    
    
    
    
}
