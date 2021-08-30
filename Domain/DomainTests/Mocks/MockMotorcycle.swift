//
//  MockMotorcycle.swift
//  DomainTests
//
//  Created by Jeison Andrey Carreño Sánchez - Ceiba Software on 27/08/21.
//

@testable import Domain

class MockMotorcycleService: AdmitionVehicle {
    
    let repositoryVehicle = MockRepositoryVehicle()
    
    func validateCuantity() -> Bool {
        
        return (repositoryVehicle.calculateNumberOfMotorcicles() <= 1000)
       
    }
    
    func messageErrorLimitVehicles() -> String {
        return "error"
    }
    
    
}
extension MockMotorcycleService: FinalizeParking{
    
    func calculateItervalBetwenAdmisionDateToFinalizationDate(date: Date) -> DateComponents {
        return DateComponents()
    }
    
    func calculateTotal(vehicle: Vehicle) -> Int {
        3000
    }
    
    
}
