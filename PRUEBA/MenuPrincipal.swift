//
//  MenuPrincipal.swift
//  PRUEBA
//
//  Created by user217123 on 6/7/22.
//

import SwiftUI

struct MenuPrincipal: View {
    
    
  private let emojiList: [EmojiItem] = [
    EmojiItem(
      emoji: "👾",
      name: "Depositos", description: ""),
    EmojiItem(
      emoji: "🚀",
      name: "Transferencias",
      description: ""),
    EmojiItem(
      emoji: "🧸",
      name: "Movimientos",
      description: ""),
    EmojiItem(
      emoji: "👩🏽‍💻",
      name: "Inverciones",
      description: ""),
    EmojiItem(
        emoji: "👩🏽‍💻",
        name: "Historial",
        description: ""),
    EmojiItem(
      emoji: "🗺",
      name: "Cerrar Sesion",
      description: ""),
  ]
    
    var body: some View {
        NavigationView{
            List(emojiList) { emojiItem in
                NavigationLink(destination: DetailsView(emojiItem: emojiItem)) {
                  HStack {
                      EmojiCircleView(emojiItem: emojiItem)
                      Text(emojiItem.name)
                  }
                  
                }
                .background(LinearGradient(gradient: Gradient(colors: [.white,.green.opacity(3)]),startPoint: .top,endPoint: .bottom).edgesIgnoringSafeArea(.all))
                
            }.navigationTitle("Banco Azteca").navigationBarHidden(false)
              
        }
    }
}

struct DetailsView: View {
    @State var tcantidad: String = ""
    @State var tdescripcion: String = ""
    @State var tnumCuenta: String = ""
    @State var cuenta: String = "1234567890123456"
    @State var saldoDisponible = ""
    @EnvironmentObject var datos : Movimientos
    @EnvironmentObject var datosT : MovimientosT
    let emojiItem: EmojiItem
    
    var body: some View {
        VStack (alignment: .leading) {
        HStack {
          EmojiCircleView(emojiItem: emojiItem)
               // .padding(.trailing, 5)
              
        Text(emojiItem.name)
          //.font(.largeTitle)
          .bold()
 
      }
            
            if (emojiItem.name == "Depositos"){
                        VStack{
                
                TextField("Cantidad De Deposito",text: $tcantidad).keyboardType(.default).autocapitalization(.none).padding(10)
                    .font(.headline)
                    .background(Color.gray.opacity(0.3))
                    .cornerRadius(6)
                TextField("Descripcion",text: $tdescripcion).keyboardType(.default).autocapitalization(.none).padding(10)
                                .font(.headline)
                                .background(Color.gray.opacity(0.3))
                                .cornerRadius(6)
            Button("Depositar") {
                datos.listaMovimientos.append(Transacciones(cantidad: tcantidad, descripcion: tdescripcion))
                }
                
            }
        }
          if (emojiItem.name == "Transferencias"){
              
              TextField("Cantidad A Transferir",text: $tcantidad).keyboardType(.default).autocapitalization(.none).padding(10)
                  .font(.headline)
                  .background(Color.gray.opacity(0.3))
                  .cornerRadius(6)
              TextField("Descripcion",text: $tdescripcion).keyboardType(.default).autocapitalization(.none).padding(10)
                              .font(.headline)
                              .background(Color.gray.opacity(0.3))
                              .cornerRadius(6)
              TextField("Numero De Cuenta",text: $tnumCuenta).keyboardType(.default).autocapitalization(.none).padding(10)
                              .font(.headline)
                              .background(Color.gray.opacity(0.3))
                              .cornerRadius(6)
              Button("Transferir") {
                                  datosT.listaMovimientosT.append(TransaccionesT(cantidad: tcantidad, descripcion: tdescripcion,numCuenta:tnumCuenta))
              }        }
                    //.padding*(
            
            if (emojiItem.name == "Historial"){
                Text("Mi Cuenta \(cuenta)")
                Text("Saldo Disponible: \(saldoDisponible)")
                Text("Transferencias")
                ForEach(datosT.listaMovimientosT) {result in
                    Text("Descripcion: \(result.descripcion)")
                    Text("Cantidad: \(result.cantidad)")
                    Text("Numero de Cuenta \(result.numCuenta)")
                }
                Text("Despositos")
                ForEach(datos.listaMovimientos, id: \.id) { result in
                    Text("Descripcion: \(result.descripcion)")
                    Text("Cantidad: \(result.cantidad)")
                
                }
            }
      Spacer()
    }
////
        ///
    .padding()
    .navigationBarTitle(Text(emojiItem.name), displayMode: .inline)
        .background(LinearGradient(gradient: Gradient(colors: [.white,.green]),startPoint: .top,endPoint: .bottom).edgesIgnoringSafeArea(.all))
        
    }
}

struct EmojiCircleView: View {
  let emojiItem: EmojiItem
  
  var body: some View {
    ZStack {
      Text(emojiItem.emoji)
        .shadow(radius: 3)
        .font(.largeTitle)
        .frame(width: 65, height: 65)
        .overlay(
          Circle().stroke(Color.purple, lineWidth: 3)
        )
    }
  }
   
}

struct EmojiItem: Identifiable {
  let id = UUID()
  let emoji: String
  let name: String
  let description: String
}

struct MenuPrincipal_Previews: PreviewProvider {
    static var previews: some View {
        MenuPrincipal()
            
    }
}
