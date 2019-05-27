//
//  ItemModel.swift
//  testWork
//
//  Created by Ильгиз Фазлыев on 27.06.2018.
//  Copyright © 2018 Ilgizzon. All rights reserved.
//

import Foundation

struct ItemsModel {
    let stock: [OneItemModel]
    let as_of: String?
}

struct OneItemModel {
    let name: String?
    let price: PriceModel
    let percent_change: Double?
    let volume: Int?
    let symbol: String?
}
struct PriceModel {
    
    let currency: String?
    let amount: Double?
}
