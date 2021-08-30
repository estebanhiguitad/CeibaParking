//
//  VehicleTest.swift
//  Domain
//
//  Created by Jeison Andrey Carreño Sánchez - Ceiba Software on 26/08/21.
//

import Foundation
public class VehicleService {
    
    private let vehicleRepository: VehicleRepository
    
    public init(vehicleRepository: VehicleRepository) {
        
        self.vehicleRepository = vehicleRepository
        
    }
    
    public func getVehicles() -> [Vehicle] {
        
        return vehicleRepository.getVehicles()
        
    }
    
    public func saveVehicle(vehicle: Vehicle, admintionVehicle: AdmitionVehicle) throws{
        
        //validacion placa
        
        if !admintionVehicle.validateCuantity() {
            throw BusinessError.limitVehicles(message: admintionVehicle.messageErrorLimitVehicles())
        }
        
        if vehicleRepository.isExistVehicle(vehicle: vehicle) {
            throw BusinessError.existPlate()
        }
        
        vehicleRepository.saveVehicle(vehicle: vehicle)
        
    }
    
    public func calculatePrice(vehicle: Vehicle, finalizeParking: FinalizeParking) -> Int{
        
        return finalizeParking.calculateTotal(vehicle: vehicle)
        
    }
    
    public func finishService(vehicle: Vehicle){
        
        vehicleRepository.finishService(vehicle: vehicle)
        
    }
    
}

public protocol AdmitionVehicle {
    
    func validateCuantity() -> Bool
    func messageErrorLimitVehicles() -> String
    
    
}

public protocol FinalizeParking{
    
    func calculateItervalBetwenAdmisionDateToFinalizationDate(date: Date) -> DateComponents
    func calculateTotal(vehicle: Vehicle) -> Int
    
}
