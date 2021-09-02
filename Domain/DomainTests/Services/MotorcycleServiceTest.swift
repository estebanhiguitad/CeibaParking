//
//  MotorcycleTest.swift
//  DomainTests
//
//  Created by Jeison Andrey Carreño Sánchez - Ceiba Software on 27/08/21.
//


import XCTest
@testable import Domain

class MotorcycleServiceTest: XCTestCase {
    
    func test_saveMotorcycle_saveMotorcycleSuccess(){
        //Arrange
        
        let motorcycleService = MotorcycleService(vehicleRepository: MockRepositoryVehicle())
        let vehicle: Vehicle = try! Motorcycle(licencePlate: "bbc", admitionDate: Date(), typeVehicle: "Moto", cylinderCapacity: 200)
        let expected = true
        
        var result = false
        
        //Act
        do {
            try motorcycleService.saveVehicle(vehicle: vehicle)
            result = true
        } catch  {
            result = false
        }
       
       
        //Assert
        XCTAssertTrue((result == expected))
        
    }
    
}

