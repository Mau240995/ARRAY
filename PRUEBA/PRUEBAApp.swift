//
//  PRUEBAApp.swift
//  PRUEBA
//
//  Created by user217123 on 6/7/22.
//

import SwiftUI
import Firebase
class AppDelegate: NSObject, UIApplicationDelegate {

  func application(_ application: UIApplication,

                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
                        FirebaseApp.configure()
                        return true

  }

}
@main
struct PRUEBAApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
      let persistenceController = PersistenceController.shared
    @StateObject var datos = Movimientos()
    @StateObject var datosT = MovimientosT()
    var body: some Scene {
        WindowGroup {
            let viewModel = AppViewModel()
            MenuPrincipal()
                .environmentObject(datos)
                .environmentObject(datosT)
                .environmentObject(viewModel)
        }
    }
}

