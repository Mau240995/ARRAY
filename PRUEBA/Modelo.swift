//
//  Modelo.swift
//  PRUEBA
//
//  Created by user217123 on 6/20/22.
//

import Foundation

class Movimientos: ObservableObject {
    @Published var listaMovimientos = [Transacciones(cantidad: "1000", descripcion: "Prueba")]
}
struct Transacciones: Identifiable {
    var id = UUID ()
    var cantidad: String
    var descripcion: String
 
    
}
class MovimientosT: ObservableObject {
    @Published var listaMovimientosT = [TransaccionesT(cantidad: "100", descripcion: "Tanda", numCuenta: "3456789098765432")]
}
struct TransaccionesT: Identifiable {
    var id = UUID ()
    var cantidad: String
    var descripcion: String
    var numCuenta: String
 
    
}
