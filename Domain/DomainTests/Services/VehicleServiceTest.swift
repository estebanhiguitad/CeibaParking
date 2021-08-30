//
//  VehicleServiceTest.swift
//  DomainTests
//
//  Created by Jeison Andrey Carreño Sánchez - Ceiba Software on 26/08/21.
//


import XCTest
import Domain

class VehicleServiceTest: XCTestCase {
    
    func test_saveVehicle_savedSuccess_vehicle(){
        //Arrange
        let vehicle = try! Vehicle(licencePlate: "", admitionDate: Date(), typeVehicle: "Moto", cylinderCapacity: 0)
        let expected = true
        var result = false
        let mockRepositoryVehicle: VehicleRepository = MockRepositoryVehicle()
        //Act
        
        do {
            try VehicleService(vehicleRepository: mockRepositoryVehicle).saveVehicle(vehicle: vehicle, admintionVehicle: MockMotorcycleService())
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
        let vehicle = try! Vehicle(licencePlate: "", admitionDate: Date(), typeVehicle: "Moto", cylinderCapacity: 0)
        let mockVehicleRepository = MockRepositoryVehicle()
       
        let expected = true
        var result = false
        //Act
        mockVehicleRepository.finishService(vehicle: vehicle)
        result = mockVehicleRepository.finishServicesSussesCalled
        
        //Assert
        XCTAssert(result == expected)
    }
    
    func test_calculatePrice_calculaSuccess_int(){
        
        //Arrange
        let vehicleService = VehicleService(vehicleRepository: MockRepositoryVehicle())
        let motorcycleService = MotorcycleService(repositoryVehicle: MockRepositoryVehicle())
        let expected = 2000
        
        let vehicle = try! Vehicle(licencePlate: "gjjk2345", admitionDate: Date(), typeVehicle: "car", cylinderCapacity: 650)
        
        var result: Int
        
        //Act
        result = vehicleService.calculatePrice(vehicle: vehicle, finalizeParking: motorcycleService)
        //Assert
        XCTAssert((result == expected))
        
    }
    
}
