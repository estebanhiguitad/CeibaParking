//
//  Motorcycle.swift
//  Domain
//
//  Created by Jeison Andrey Carreño Sánchez - Ceiba Software on 30/08/21.
//
import Foundation

public class Motorcycle: Vehicle {
    
    private var cylinderCapacity: Int
    
    public init(licencePlate: String, admitionDate: Date, cylinderCapacity: Int) throws {
        self.cylinderCapacity = cylinderCapacity
        
        do {
            try super.init(licencePlate: licencePlate, admitionDate: admitionDate)
        } catch  {
            throw error
        }
    }
    
    public func getCylinderCapacity() -> Int?{
        return self.cylinderCapacity
    }
    
    public func calculateTotal() -> Int {
        
        let totalValue = super.calculateTotal(pricePerDays: 4000, pricePerHours: 500)
        let extraPrice = 2000
        let limitCylinderCapacity = 600
        
        return totalValue + ((cylinderCapacity > limitCylinderCapacity) ? extraPrice : 0)
    }
    
}
