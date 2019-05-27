//
//  MapperCoreI.swift
//  testWork
//
//  Created by Ильгиз Фазлыев on 27.06.2018.
//  Copyright © 2018 Ilgizzon. All rights reserved.
//

import Foundation
protocol MapperCoreI {
    func load(_itemDict:[String: Any]) ->[OneItemModel]?
}
