//
//  Inject.swift
//  testWork
//
//  Created by Ильгиз Фазлыев on 27.06.2018.
//  Copyright © 2018 Ilgizzon. All rights reserved.
//

import Foundation
import Swinject

final class Inject {
    
    
    static var shared = Inject()
    private static var apiKey: String = ""
    private let container: Container
    private let assembler: Assembler
    
    init() {
        self.container = Container()
        self.assembler = Assembler()
    }
}

extension Inject: InjectI {
    
    func apiSerivice() -> ApiServiceI {
        return assembler.resolve()
    }
}
