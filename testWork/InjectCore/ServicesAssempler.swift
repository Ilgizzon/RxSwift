//
//  ServicesAssempler.swift
//  testWork
//
//  Created by Ильгиз Фазлыев on 27.06.2018.
//  Copyright © 2018 Ilgizzon. All rights reserved.
//

import Foundation
protocol ServicesAssempler {
    func resolve() -> ApiServiceI
}
extension ServicesAssempler where Self: Assembler {
    
    func resolve() -> ApiServiceI {
        return ApiService(webClient: resolve(), webRequestGenerator: resolve(), mapper: resolve())
    }

}
