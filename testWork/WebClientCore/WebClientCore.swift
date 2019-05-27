//
//  WebClientCore.swift
//  testWork
//
//  Created by Ильгиз Фазлыев on 27.06.2018.
//  Copyright © 2018 Ilgizzon. All rights reserved.
//

import Foundation
import Alamofire
final class WebClientCore {
    
    let baseURL: URL
    
    init(baseUrl: String) {
        self.baseURL = URL.init(string: baseUrl)!
    }
    
    fileprivate func get(urlPath: String,
                         success: @escaping (AnyObject) -> Void,
                         failure: @escaping (WebClientError) -> Void) {
        
        let url = baseURL.appendingPathComponent(urlPath)
    
        request(url).responseJSON { dataResponse in
            
            if dataResponse.result.isSuccess {
                guard let data = dataResponse.result.value else {
                    failure(WebClientError.IncorrectDataReturned)
                    return
                }
                success(data as AnyObject)
            } else if let statusCode = dataResponse.response?.statusCode {
                failure(WebClientError(code: statusCode))
            } else {
                failure(.Unknown)
            }
        }
    }

}

extension WebClientCore: WebClientCoreI {
    
    func sendRequest(request: WebClientRequestModel,
                     success: @escaping (Any) -> Void,
                     failure: @escaping (WebClientError) -> Void) {
        
        switch(request.methodType) {
        case .get:
            get(urlPath: request.httpResurcePath, success: { data in
                success(data)
            }, failure: { webClientError in
                failure(webClientError)
            })
        }
    }
}
