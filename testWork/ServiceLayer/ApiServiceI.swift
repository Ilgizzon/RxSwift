//
//  ApiServiceI.swift
//  testWork
//
//  Created by Ильгиз Фазлыев on 27.06.2018.
//  Copyright © 2018 Ilgizzon. All rights reserved.
//

import Foundation

protocol ApiServiceI {
    func loadNew(complete: @escaping ([OneItemModel]) -> Void,
                  failure: @escaping (WebClientError) -> Void)
}
