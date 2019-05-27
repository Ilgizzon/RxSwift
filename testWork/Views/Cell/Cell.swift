//
//  Cell.swift
//  testWork
//
//  Created by Ильгиз Фазлыев on 27.06.2018.
//  Copyright © 2018 Ilgizzon. All rights reserved.
//

import UIKit

class Cell: UITableViewCell {

    @IBOutlet weak var nameLB: UILabel!
    @IBOutlet weak var volumeLB: UILabel!
    @IBOutlet weak var amountLB: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setItem(_ item: OneItemModel) {
        if let name = item.name{
            nameLB.text = name
        }
        if let valume = item.volume{
            volumeLB.text = String(valume)
        }
        if let amount = item.price.amount{
            amountLB.text = String(amount.rounded(toPlaces: 2))
        }
    }
}
