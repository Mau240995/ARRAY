//
//  Array.swift
//  PRUEBA
//
//  Created by user217123 on 6/17/22.
//

import Swift
import Combine

class ListadoImagenes: ObservableObject {
    @Published var  arrayImagenes: [Imagenes] = [Imagenes(name: "Logo", image: "logotipo")]
}
struct Imgenes: Identifiable {
    var id = UUID()
    var name: String
    var image: String
}








       
