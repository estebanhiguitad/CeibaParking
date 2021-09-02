//
//  VehicleServiceTest.swift
//  DomainTests
//
//  Created by Jeison Andrey Carreño Sánchez - Ceiba Software on 26/08/21.
//


import XCTest
@testable import Domain

class VehicleServiceTest: XCTestCase {
    
    func test_saveVehicle_savedSuccess_vehicle(){
        //Arrange
        let vehicle = try! Vehicle(licencePlate: "", admitionDate: Date(), typeVehicle: "Moto")
        let expected = true
        var result = false
        let mockRepositoryVehicle: VehicleRepository = MockRepositoryVehicle()
        
        //Act
        do {
            try VehicleService(vehicleRepository: mockRepositoryVehicle).saveVehicle(vehicle: vehicle)
            result = true
        } catch  {
            result = false
        }
        
        //Assert
        XCTAssert(result == expected)
        
        
    }
    
    func test_getVehicles_getVehiclesSuccess_vehicle() {
        //Arrange
        let mockVehicleRepository = MockRepositoryVehicle()
        var listVehicles: [Vehicle]?
        
        let expected = true
        var result = false
        //Act
        listVehicles = mockVehicleRepository.getVehicles()
        //Assert
        result = (listVehicles != nil)
        XCTAssert(result == expected)
    }
    
    func test_finishService_finishServiceSuccess_vehicle() {
        //Arrange
        let vehicle = try! Vehicle(licencePlate: "", admitionDate: Date(), typeVehicle: "Moto")
        let mockVehicleRepository = MockRepositoryVehicle()
       
        let expected = true
        var result = false
        //Act
        mockVehicleRepository.finishService(vehicle: vehicle)
        result = mockVehicleRepository.finishServicesSussesCalled
        
        //Assert
        XCTAssert(result == expected)
    }
    
    
}
