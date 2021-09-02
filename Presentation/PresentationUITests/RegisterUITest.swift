//
//  RegisterUITest.swift
//  PresentationUITests
//
//  Created by Jeison Andrey Carreño Sánchez - Ceiba Software on 2/09/21.
//

import XCTest

class RegisterUITest: XCTestCase {

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

    func testRegisterFormMotorcycle(){
        let app = XCUIApplication()
        app/*@START_MENU_TOKEN@*/.segmentedControls/*[[".scrollViews.segmentedControls",".segmentedControls"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.buttons["Moto"].tap()
        
        let elementsQuery = app.scrollViews.otherElements
        let cilindrajeTextField = elementsQuery.textFields["Clindraje"]
        cilindrajeTextField.tap()
        cilindrajeTextField.typeText("700")
        
        let nMeroPlacaTextField = elementsQuery.textFields["Número placa"]
        nMeroPlacaTextField.tap()
        nMeroPlacaTextField.typeText("123")
        
        let letrasPlacaTextField = elementsQuery.textFields["Letras placa"]
        letrasPlacaTextField.tap()
        letrasPlacaTextField.typeText("abc")
        
        let fechaIngresoTextField = elementsQuery.textFields["Fecha ingreso"]
        fechaIngresoTextField.tap()
        
        app.toolbars["Toolbar"].buttons["Done"].tap()
        app/*@START_MENU_TOKEN@*/.buttons["Guardar"]/*[[".scrollViews.buttons[\"Guardar\"]",".buttons[\"Guardar\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.staticTexts["Guardar"].tap()
        app.alerts["Alerta"].scrollViews.otherElements.buttons["Aceptar"].tap()
               
    }
    
    func testRegisterFormCar(){
        
        let app = XCUIApplication()
        app/*@START_MENU_TOKEN@*/.segmentedControls/*[[".scrollViews.segmentedControls",".segmentedControls"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.buttons["Carro"].tap()
        
        let elementsQuery = app.scrollViews.otherElements
        let nMeroPlacaTextField = elementsQuery.textFields["Número placa"]
        nMeroPlacaTextField.typeText("123")
        nMeroPlacaTextField.tap()
        
        let letrasPlacaTextField = elementsQuery.textFields["Letras placa"]
        letrasPlacaTextField.tap()
        letrasPlacaTextField.typeText("abb")
        
        let fechaIngresoTextField = elementsQuery.textFields["Fecha ingreso"]
        fechaIngresoTextField.tap()
        
        app.toolbars["Toolbar"].buttons["Done"].tap()
        app/*@START_MENU_TOKEN@*/.buttons["Guardar"]/*[[".scrollViews.buttons[\"Guardar\"]",".buttons[\"Guardar\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.staticTexts["Guardar"].tap()
        app.alerts["Alerta"].scrollViews.otherElements.buttons["Aceptar"].tap()
        
    }

}
