//
//  ViewControllerViewModel.swift
//  testWork
//
//  Created by Ильгиз Фазлыев on 27.06.2018.
//  Copyright © 2018 Ilgizzon. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

enum ViewControllerStateType {
    case none
    case loading(Bool)
}

protocol ViewControllerModelI {
    
    // Input
    func loadingData(fromUI: Bool)
    
    // Output
    var itemsData: Driver<[OneItemModel]> { get }
    var loadingState: Driver<ViewControllerStateType> { get }
}

final class ViewControllerModel {
    
    private let bag = DisposeBag()
    private var timer: Timer!
    private let apiService: ApiServiceI!
    private var _loadingState = BehaviorRelay<ViewControllerStateType>(value: .none)
    

    
    // MARK: Outputs
    public var _itemsData = BehaviorRelay<[OneItemModel]>(value: [])
    
    init(apiService: ApiServiceI) {
        self.apiService = apiService
        self.bindInput()
    }
    
    private func bindInput() {
        loadingData(fromUI: false)
    }
  
}

extension ViewControllerModel: ViewControllerModelI {


    @objc func loadingData(fromUI: Bool) {
    
        if(fromUI){
            timer.invalidate()
        }
        self._loadingState.accept(.loading(true))
        self.apiService.loadNew(complete: { items in
        self._loadingState.accept(.loading(false))
        self._itemsData.accept(items)
        self.reLoader()
        
    }) { webClientError in
        print(webClientError)
        self.reLoader()
        
    }
    }
    private func reLoader(){
        timer = Timer.scheduledTimer(timeInterval: 15, target: self, selector: #selector(loadingData), userInfo: nil, repeats: false)
    }
    // Output
    var loadingState: Driver<ViewControllerStateType> { return _loadingState.asDriver() }
    var itemsData: Driver<[OneItemModel]> { return _itemsData.asDriver() }
}
