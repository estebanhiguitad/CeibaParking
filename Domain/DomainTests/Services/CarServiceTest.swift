//
//  CarServiceTest.swift
//  DomainTests
//
//  Created by Jeison Andrey Carreño Sánchez - Ceiba Software on 27/08/21.
//
import XCTest
@testable import Domain

class CarServiceTest: XCTestCase {
    
    func test_saveCar_saveMotorcycleSuccess(){
        //Arrange
        let motorcycleService = CarService(vehicleRepository: MockRepositoryVehicle())
        let vehicle: Vehicle = try! Vehicle(licencePlate: "bbc", admitionDate: Date())
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

