//
//  Vehicle.swift
//  Domain
//
//  Created by Jeison Andrey Carreño Sánchez - Ceiba Software on 26/08/21.
//

import Foundation
public class Vehicle {
    
    private var licencePlate: String
    private var admitionDate: Date
    private var typeVehicle: String
    private var cylinderCapacity: Int?
    
    public init(licencePlate: String, admitionDate: Date, typeVehicle: String, cylinderCapacity: Int?) throws{
        
        self.licencePlate = licencePlate
        self.admitionDate = admitionDate
        self.typeVehicle = typeVehicle
        self.cylinderCapacity = cylinderCapacity
        
        try validateLettrByDay(licencePlate: licencePlate, admitionDate: admitionDate)
        
    }
    
    public func setLicencePlate(licencePlate: String){
        
        self.licencePlate = licencePlate
        
    }
    
    public func setAdmitionDate(admitionDate: Date){
        
        self.admitionDate = admitionDate
        
    }
    
    public func setTypeVehicle(typeVehicle: String){
        
        self.typeVehicle = typeVehicle
        
    }
    
    public func setCylinderCapacity(cylinderCapacity: Int){
        
        self.cylinderCapacity = cylinderCapacity
        
    }
    
    public func getLicencePlate() -> String{
        
        return self.licencePlate
        
    }
    
    public func getAdmitionDate() -> Date{
        
        return self.admitionDate
        
    }
    
    public func getTypeVehicle() -> String{
        
        return self.typeVehicle
        
    }
    
    public func getCylinderCapacity() -> Int?{
        
        return self.cylinderCapacity
        
    }
    
    private func validateLettrByDay(licencePlate: String, admitionDate: Date) throws{
        
        let numberDay = getNumberDay(date: admitionDate)
        
        if numberDay == 1 && licencePlate.first?.lowercased() == "a"{
            
            throw BusinessError.dayInvalidPlate(message: "El día lunes no pueden ingresar vehiculos con la placa A")
            
        }
        
    }
    
    private func getNumberDay(date: Date) -> Int{
        
        let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "D"
        let index = Calendar.current.component(.weekday, from: Date()) // this returns an Int
        return index
        
    }
}
