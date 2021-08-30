//
//  MotorcycleServices.swift
//  Domain
//
//  Created by Jeison Andrey Carreño Sánchez - Ceiba Software on 27/08/21.
//

import Foundation
public class MotorcycleService{
    
    private var repositoryVehicle: VehicleRepository
    
    public init(repositoryVehicle: VehicleRepository) {
        
        self.repositoryVehicle = repositoryVehicle
        
    }
}
extension MotorcycleService: AdmitionVehicle{
    
    public func validateCuantity() -> Bool {
        
        return (repositoryVehicle.calculateNumberOfMotorcicles() <= 10)
        
    }
    
    public func messageErrorLimitVehicles() -> String {
        
        return "La moto no puede ingresar. Ya sobrepasamos el limite."
        
    }
    
    
}

extension MotorcycleService: FinalizeParking{
    
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
        
        return payPerDays + payPerHours + ((vehicle.getCylinderCapacity()! > 600) ? 2000 : 0)
        
    }
    
}
