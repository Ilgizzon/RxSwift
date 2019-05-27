//
//  ComponentsAssembler.swift
//  testWork
//
//  Created by Ильгиз Фазлыев on 27.06.2018.
//  Copyright © 2018 Ilgizzon. All rights reserved.
//

import Foundation
protocol ComponentsAssembler {
    func resolve() -> MapperCoreI
    func resolve() -> WebRequestGeneratorCoreI
    func resolve() -> WebClientCoreI
}

extension ComponentsAssembler where Self: Assembler {

    func resolve() -> WebClientCoreI {
        return WebClientCore(baseUrl: Constants.Urls.BaseURL)
    }
    func resolve() -> WebRequestGeneratorCoreI {
        return WebRequestGeneratorCore()
    }

    func resolve() -> MapperCoreI {
        return MapperCore()
    }

}
