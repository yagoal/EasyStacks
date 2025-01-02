//
//  AppDelegate.swift
//  EasyStacks
//
//  Created by Yago Augusto on 01/01/25.
//

import UIKit
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow? // Adicione esta propriedade para suporte ao iOS 12

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Configuração para iOS 12
        if #available(iOS 13, *) {
            // Não precisa configurar o UIWindow aqui para iOS 13+
        } else {
            // Configuração para iOS 12
            let window = UIWindow(frame: UIScreen.main.bounds)
            window.rootViewController = ViewController() // Substitua pelo seu ViewController inicial
            window.makeKeyAndVisible()
            self.window = window
        }
        return true
    }

    // MARK: UISceneSession Lifecycle

    @available(iOS 13.0, *) // Disponível apenas no iOS 13+
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    @available(iOS 13.0, *) // Disponível apenas no iOS 13+
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Implementação vazia para iOS 13+, se necessário
    }
}

