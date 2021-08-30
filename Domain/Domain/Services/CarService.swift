//
//  CarService.swift
//  Domain
//
//  Created by Jeison Andrey Carreño Sánchez - Ceiba Software on 27/08/21.
//

import Foundation
public class CarService{
    
    private var repositoryVehicle: VehicleRepository
    
    public init(repositoryVehicle: VehicleRepository) {
        
        self.repositoryVehicle = repositoryVehicle
        
    }
}
extension CarService: AdmitionVehicle{
    
    public func validateCuantity() -> Bool {
        
        return (repositoryVehicle.calculateNumberOfCars() <= 20)
        
    }
    
    public func messageErrorLimitVehicles() -> String {
        
        return "El carro no puede ingresar. Ya sobrepasamos el limite."
        
    }
    
}

extension CarService: FinalizeParking{
    
    public func calculateItervalBetwenAdmisionDateToFinalizationDate(date: Date) -> DateComponents {
        
        return Calendar.current.dateComponents([.hour, .day], from: date, to: Date())
        
    }
    
    public func calculateTotal(vehicle: Vehicle) -> Int {
        
        let diferenceBetwenDates = calculateItervalBetwenAdmisionDateToFinalizationDate(date: vehicle.getAdmitionDate())
        let payPerDays = diferenceBetwenDates.day ?? 0 * 8000
        var payPerHours = 0
        if (diferenceBetwenDates.hour ?? 0 > 9){
            payPerHours = 8000
        }else{
            payPerHours = diferenceBetwenDates.hour! * 1000
        }
       
        return payPerDays + payPerHours
        
    }
    
}
