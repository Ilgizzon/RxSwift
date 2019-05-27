//
//  MapperCore.swift
//  testWork
//
//  Created by Ильгиз Фазлыев on 27.06.2018.
//  Copyright © 2018 Ilgizzon. All rights reserved.
//

import Foundation
final class MapperCore: MapperCoreI {
    
    func load(_itemDict:[String: Any]) -> [OneItemModel]? {
   //     var result: ItemsModel
        var items: [OneItemModel] = []
        if let itemArr = _itemDict["stock"] as? [[String: Any]] {
            for itemDic in itemArr{
                let price = mapPrice(itemDic["price"] as! [String : Any])
                let item = OneItemModel(name: itemDic["name"] as? String, price: price,
                                        percent_change: itemDic["percent_change"] as? Double,
                                        volume: itemDic["volume"] as? Int,
                                        symbol: itemDic["symbol"] as? String)
                items.append(item)
            }
        }
     //   let as_of = _itemDict["as_of"] as? String
       // result = ItemsModel(stock: items, as_of: as_of)
        return items
        
    }
    
    private func mapPrice(_ price: [String: Any]) -> PriceModel{
        let price = PriceModel(currency: price["currency"] as? String, amount: price["amount"] as? Double)
        return price;
    }
    

}
