//
//  VehicleTest.swift
//  DomainTests
//
//  Created by Jeison Andrey Carreño Sánchez - Ceiba Software on 30/08/21.
//
import XCTest
@testable import Domain
class VehicleTest: XCTestCase  {
    
    func test_getLicencePlate_getLicencePlateSuccess_string(){
        //Arrange
        let expected = "cbc"
        var result = ""
        let vehicle = try! Vehicle(licencePlate: expected, admitionDate: Date())

        //Act
        result = vehicle.getLicencePlate()

        //Assert
        XCTAssertTrue(result == expected)
        
    }
    
    func test_getAdmitionDate_getAdmitionDate_date(){
        //Arrange
        let expected = Date()
        var result: Date
        let vehicle = try! Vehicle(licencePlate: "cbc", admitionDate: expected)

        //Act
        result = vehicle.getAdmitionDate()

        //Assert
        XCTAssertTrue(result == expected)
        
    }
    
    func test_getTotal_getTotalSuccess_date(){
        //Arrange
        let expected = 0
        var result: Int
        let vehicle = try! Vehicle(licencePlate: "cbc", admitionDate: Date())

        //Act
        result = vehicle.calculateTotal(pricePerDays: 8000, pricePerHours: 1000)

        //Assert
        XCTAssertTrue(result == expected)
        
    }
    
    /*func test_validateLettrByDay_validateLettrByDaySuccess_Bool(){
        //Arrange
        let expected = false
        var result: Bool
        let vehicle = try! Vehicle(licencePlate: "cbc", admitionDate: Date())

        //Act
        result = vehicle.getTotal()

        //Assert
        XCTAssertTrue(result == expected)
        
    }*/
    
}
