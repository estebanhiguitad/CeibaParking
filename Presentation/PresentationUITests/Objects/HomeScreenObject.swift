//
//  HomeScreenObject.swift
//  PresentationUITests
//
//  Created by Jeison Andrey Carreño Sánchez - Ceiba Software on 2/09/21.
//

import Foundation
import XCTest

struct HomeScreenObject: Screen {
    var app: XCUIApplication
    
    private enum Identifiers {
        static let boucherButton = "Facturar"
        static let registerButton = "Registrar"
        static let tabBar = "Tab Bar"
    }
    
    func tapBoucherButton() -> Self{
        let tabBar = XCUIApplication().tabBars[Identifiers.tabBar]
        tabBar.buttons[Identifiers.boucherButton].tap()
        
        return self
    }
    
    func tapRegisterButton() -> Self{
        let tabBar = XCUIApplication().tabBars[Identifiers.tabBar]
        tabBar.buttons[Identifiers.registerButton].tap()
        
        return self
    }
}
