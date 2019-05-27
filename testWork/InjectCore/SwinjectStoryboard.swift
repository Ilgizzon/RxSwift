//
//  SwinjectStoryboard.swift
//  testWork
//
//  Created by Ильгиз Фазлыев on 27.06.2018.
//  Copyright © 2018 Ilgizzon. All rights reserved.
//

import SwinjectStoryboard

extension SwinjectStoryboard {
    
    @objc class func setup() {
        
        
        let inject = Inject.shared
        
        //
        // View Models
        //
        
        defaultContainer.register(ViewControllerModelI.self) {
            _ in ViewControllerModel(apiService: inject.apiSerivice())
        }

        
        //
        // Views (ViewControllers)
        //
        defaultContainer.storyboardInitCompleted(ViewController.self) { r, c in
            c.viewModel = r.resolve(ViewControllerModelI.self)
        }

    }
}










