//
//  FinalizeVehicleService.swift
//  Presentation
//
//  Created by Jeison Andrey Carreño Sánchez - Ceiba Software on 29/08/21.
//

import Foundation
import Domain
import DataAccessLocal

class FinalizeVehicleService: FinalizeVehicleProtocols {
    
    var vehiclePresentationTranslator: VehiclePresentationTranslator
    var vehicleService: VehicleService
    var vehicleRepository: VehicleRepository
    
    init() {
        self.vehicleRepository = VehicleRepositoryRealm()
        vehiclePresentationTranslator = VehiclePresentationTranslator()
        vehicleService = VehicleService(vehicleRepository: vehicleRepository)
    }
    
    func getVehicles() throws -> [VehicleEntity]{
        /*let vehicles = vehicleService.getVehicles().map({
            getTypeVehicle(vehicle: $0)
        })*/
        return []
    }
    
    func finalizeService(vehicleEntity: VehicleEntity) throws {
        do {
            try vehicleService.finishService(vehicle: vehiclePresentationTranslator.fromPresentationEntityToDomainModel(vehicleEntity: vehicleEntity))
        } catch {
            throw error
        }
    }
    
    func getTypeVehicle(vehicle: Vehicle) -> VehicleEntity {
        let typeVehicleEnum = TypeVehicleEnum(rawValue: vehicle.getTypeVehicle())
        
        switch typeVehicleEnum {
        case .car:
            return  CarPresentationTranslator().fromDomainToPresentationEntity(vehicle: vehicle)
        case .motorcycle:
            return  MotorcyclePresentationTranslator().fromDomainToPresentationEntity(vehicle: vehicle)
        case .none:
            return  CarPresentationTranslator().fromDomainToPresentationEntity(vehicle: vehicle)
        }
    }
    
    func getOptionsVehicles() -> [OptionVehicleEntity] {
        return [
            OptionVehicleEntity(name: .motorcycle, service: MotorcycleService(vehicleRepository: MotorcycleRepositoryRealm()), translator: MotorcyclePresentationTranslator()),
                                
            OptionVehicleEntity(name: .car,  service: CarService(vehicleRepository: CarRepositoryRealm()), translator: CarPresentationTranslator())
        ]
    }
    
    func getVehicleByPlate(optionVehicleEntity: OptionVehicleEntity, plate: String) -> VehicleEntity?{
        if let vehicleEntity = optionVehicleEntity.service.getVehicleByPlate(plate: plate){
            return optionVehicleEntity.translator.fromDomainToPresentationEntity(vehicle: vehicleEntity)
        }
        return nil
    }
    
}
