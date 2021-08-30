//
//  MockVehicleService.swift
//  DomainTests
//
//  Created by Jeison Andrey Carreño Sánchez - Ceiba Software on 29/08/21.
//

import Foundation
import Domain

class MockCarService: AdmitionVehicle {
    
    let repositoryVehicle = MockRepositoryVehicle()
    
    func validateCuantity() -> Bool {
        return (repositoryVehicle.calculateNumberOfMotorcicles() <= 1000)
    }
    
    func messageErrorLimitVehicles() -> String {
        return "error"
    }
    
}

extension MockCarService: FinalizeParking{
    func calculateItervalBetwenAdmisionDateToFinalizationDate(date: Date) -> DateComponents {
        return DateComponents()
    }
    
    func calculateTotal(vehicle: Vehicle) -> Int {
        3000
    }
}
