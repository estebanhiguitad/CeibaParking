//
//  Car.swift
//  Domain
//
//  Created by Jeison Andrey Carreño Sánchez - Ceiba Software on 30/08/21.
//

public class Car: Vehicle {
    public func calculateTotal() -> Int {
        
        return super.calculateTotal(pricePerDays: 8000, pricePerHours: 1000)
    }
}
