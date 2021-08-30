//
//  BusinessException.swift
//  Domain
//
//  Created by Andrés David Santacoloma Isaza - Ceiba Software on 23/11/20.
//

public enum BusinessError: Error {
    
    case limitVehicles(message: String = "Limite de vehiculos alcanzado")
    case existPlate(message: String = "Placa invalida ya existe en el sistema")
    case dayInvalidPlate(message: String = "Este dia no pueden entrar vehiculos que la placa comience en A")
    case invalidNumberMotorcycles(message: String = "Sobrepasamos el numero de motos")
    case invalidNumberCars(message: String = "Sobrepasamos el numero de carros")
    
}
