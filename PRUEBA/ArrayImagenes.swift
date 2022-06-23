//
//  ArrayImagenes.swift
//  PRUEBA
//
//  Created by user217123 on 6/17/22.
//

import SwiftUI

struct ArrayImagenes: View {
    @State var tname = ""
    @State var timage = ""
    @State var arrayImagenes : [Imagenes] = [Imagenes(name:"prueba", image: "https://i.blogs.es/ceda9c/dalle/1366_2000.jpg")]
    
    var body: some View {
        VStack{
            Group {
                TextField("Nombre De la Imagen", text: $tname)
                    .textFieldStyle(RoundedBorderTextFieldStyle())               .disableAutocorrection(true)
                    .keyboardType(.default).autocapitalization(.none)                    .frame(height: 44)
                TextField("Url de la Imagen", text: $timage)
                    .textFieldStyle(RoundedBorderTextFieldStyle())                .disableAutocorrection(true)
                    .keyboardType(.default).autocapitalization(.none)                    .frame(height: 44)
                

                Button("Done!") {
                    arrayImagenes.append(Imagenes(name: tname, image: timage))
                    
                }
                
                ForEach(arrayImagenes, id: \.id) { result in
                    
                    Text("Result: \(result.name)")
                    AsyncImage(url: URL(string: "\(result.image)"), scale: 2) { image in
                                image
                                  .resizable()
                                  .aspectRatio(contentMode: .fill)
                            } placeholder: {
                                Color.gray
                            }
                            .frame(width: 100, height: 100, alignment: .center)                    //Image("\(result.image)"
                }
                Spacer()
            }
            
        }
        
    }
}

struct ArrayImagenes_Previews: PreviewProvider {
    static var previews: some View {
        ArrayImagenes()
    }
}
struct Imagenes: Identifiable {
    var id = UUID()
    var name: String
    var image: String
    
}
