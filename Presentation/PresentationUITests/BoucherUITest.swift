//
//  BoucherUITest.swift
//  PresentationUITests
//
//  Created by Jeison Andrey Carreño Sánchez - Ceiba Software on 2/09/21.
//

import XCTest

class BoucherUITest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFinalizeParkingByMotorcycle(){
        let app = XCUIApplication()
        app.tabBars["Tab Bar"].buttons["Facturar"].tap()
        app.textFields["Buscar placa"].tap()
        app.scrollViews.otherElements.textFields["Letras placa"].tap()
        app.scrollViews.otherElements.textFields["Letras placa"].tap()
        
    }
    
    func testFinalizeParkingByCar(){
        
        let app = XCUIApplication()
        app.tabBars["Tab Bar"].buttons["Facturar"].tap()
        app.textFields["Tipo de vehículo"].tap()
        app/*@START_MENU_TOKEN@*/.pickerWheels["Moto"]/*[[".pickers.pickerWheels[\"Moto\"]",".pickerWheels[\"Moto\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeUp()
        app.toolbars["Toolbar"].buttons["Done"].tap()
        app.textFields["Buscar placa"].tap()
        app.scrollViews.otherElements.textFields["Letras placa"].tap()
        
    }
}
