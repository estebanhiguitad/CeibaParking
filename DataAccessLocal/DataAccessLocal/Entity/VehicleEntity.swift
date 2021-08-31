//
//  VehicleEntity.swift
//  DataAccessLocal
//
//  Created by Jeison Andrey Carreño Sánchez - Ceiba Software on 26/08/21.
//

import Foundation
import RealmSwift

class VehicleEntity: Object {
    
    @objc dynamic var licencePlate = ""
    @objc dynamic var admitionDate = Date()
    @objc dynamic var cylinderCapacity = 0
    @objc dynamic var typeVehicle = ""
    
}
