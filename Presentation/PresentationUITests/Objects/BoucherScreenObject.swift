//
//  BoucherScreenObject.swift
//  PresentationUITests
//
//  Created by Jeison Andrey Carreño Sánchez - Ceiba Software on 2/09/21.
//

import Foundation
import XCTest

struct BoucherScreenObject: Screen {
    var app: XCUIApplication
    
    private enum Identifiers {
       
        static let searchPlateTextField = "Buscar placa"
        static let typeVehicleTextField = "Tipo de vehículo"
        static let toolbar = "Toolbar"
        static let alert = "Alerta"
        static let done = "done"
        static let finalizeButton = "Letras placa"
       
    }
    
    func tapSearchPlateTextField(_ text: String) -> Self{
        let searchPlateTextField = app.textFields[Identifiers.searchPlateTextField]
        searchPlateTextField.tap()
        searchPlateTextField.typeText(text)
        return self
    }
    
    func tapTypeVehicleTextField() -> Self{
        let typeVehicleTextField = app.textFields[Identifiers.typeVehicleTextField]
        typeVehicleTextField.tap()
       
        return self
    }
    
    func tapPickerWheels(_ typeVehicle: String) -> Self{
        
        app.pickerWheels[typeVehicle].swipeUp()
        return self
    }
    
    func tapPickerWheelsDown(_ typeVehicle: String) -> Self{
        
        app.pickerWheels[typeVehicle].swipeUp()
        return self
    }
     
    func tapFinalizeButton() -> Self{
        app.scrollViews.otherElements.textFields["Letras placa"].tap()
        
        return self
    }
    
    
    func tapAlert(_ segmenName: String) -> Self{
        app.alerts[Identifiers.alert].scrollViews.otherElements.buttons[Identifiers.alert].tap()
        return self
    }
}
