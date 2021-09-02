//
//  ErrorExtension.swift
//  Presentation
//
//  Created by Jeison Andrey Carreño Sánchez - Ceiba Software on 2/09/21.
//

import Foundation
extension Error{
    
    func decriptionMessage() -> String{
        let errorString = String(describing: self)
        let arrString = errorString.split(separator: "\"")
        return String(arrString[1])
    }
    
}
