//
//  WebClientCoreI.swift
//  testWork
//
//  Created by Ильгиз Фазлыев on 27.06.2018.
//  Copyright © 2018 Ilgizzon. All rights reserved.
//

import Foundation

protocol WebClientCoreI {
    func sendRequest(request: WebClientRequestModel,
                     success: @escaping (Any) -> Void,
                     failure: @escaping (WebClientError) -> Void )
}
