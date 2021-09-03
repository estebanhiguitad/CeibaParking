//
//  RegisterScreenObject.swift
//  PresentationUITests
//
//  Created by Jeison Andrey Carreño Sánchez - Ceiba Software on 2/09/21.
//

import Foundation
import XCTest

struct RegisterScreenObject: Screen {
    var app: XCUIApplication
    
    private enum Identifiers {
        static let cilinderTextField = "Clindraje"
        static let numberPlateTextField = "Número placa"
        static let lettersPlateTextField = "Letras placa"
        static let admitionDateTextField = "Fecha ingreso"
        static let toolbars = "toolbars"
        static let alert = "Alerta"
        static let done = "done"
        static let save = "Guardar"
    }
    
    func typeCylinder(_ text: String) -> Self{
        let cilinderTextField = app.textFields[Identifiers.cilinderTextField]
        cilinderTextField.tap()
        cilinderTextField.typeText(text)
        return self
    }
    
    func typeNumberPlateTextField(_ text: String) -> Self{
        let numberPlateTextField = app.textFields[Identifiers.numberPlateTextField]
        numberPlateTextField.tap()
        numberPlateTextField.typeText(text)
        return self
    }
    
    func typeLettersPlateTextField(_ text: String) -> Self{
        let lettersPlateTextField = app.textFields[Identifiers.lettersPlateTextField]
        lettersPlateTextField.tap()
        lettersPlateTextField.typeText(text)
        return self
    }
    
    func typeAdmitionDateTextField() -> Self{
        let admitionDateTextField = app.textFields[Identifiers.admitionDateTextField]
        admitionDateTextField.tap()
        
        app.scrollViews.otherElements.textFields["Fecha ingreso"].tap()
        app.toolbars["Toolbar"].buttons["Done"].tap()
        
        return self
    }
     
    func tapSave() -> Self{
        app.buttons[Identifiers.save].staticTexts[Identifiers.save].tap()
        
        return self
    }
    
    func tapSegment(_ segmenName: String) -> Self{
        app/*@START_MENU_TOKEN@*/.segmentedControls/*[[".scrollViews.segmentedControls",".segmentedControls"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.buttons[segmenName].tap()
        return self
    }
    
    func tapAlert(_ segmenName: String) -> Self{
        app.alerts[Identifiers.alert].scrollViews.otherElements.buttons[Identifiers.alert].tap()
        return self
    }
}
