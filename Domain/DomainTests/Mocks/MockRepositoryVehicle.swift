//
//  MockRepositoryVehicle.swift
//  DomainTests
//
//  Created by Jeison Andrey Carreño Sánchez - Ceiba Software on 27/08/21.
//

import Foundation
import Domain
class MockRepositoryVehicle: VehicleRepository{
    
    public var saveVehicleSussesCalled: Bool = false
    public var finishServicesSussesCalled: Bool = false
    
    func saveVehicle(vehicle: Vehicle) {
        saveVehicleSussesCalled = true
    }
    
    func isExistVehicle(vehicle: Vehicle) -> Bool {
        false
    }
    
    func getVehicles() -> [Vehicle] {
        return []
    }
    
    func calculatePrice(vehicle: Vehicle) -> String {
        return ""
    }
    
    func calculateParkingHours(vehicle: Vehicle) -> Int {
        return 1
    }
    
    func calculateNumberOfMotorcicles() -> Int {
        return 0
    }
    
    func calculateNumberOfCars() -> Int {
        return 0
    }
    
    func finishService(vehicle: Vehicle) {
        finishServicesSussesCalled = true
    }
    
    func validateCylinderCapacity(vehicle: Vehicle) {
        
    }
    
    func validteLicencePlateByDAY(vehicle: Vehicle) -> Bool {
        return false
    }
    
}
