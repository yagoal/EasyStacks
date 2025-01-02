//
//  SceneDelegate.swift
//  EasyStacks
//
//  Created by Yago Augusto on 01/01/25.
//

import UIKit

@available(iOS 13.0, *) // Disponível apenas no iOS 13 e superior
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Configuração para iOS 13+
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = ViewController() // Substitua pelo seu ViewController inicial
        window.makeKeyAndVisible()
        self.window = window
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Chamado quando a cena está sendo liberada pelo sistema.
        // Libere recursos aqui, se necessário.
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Chamado quando a cena se torna ativa novamente.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Chamado quando a cena se torna inativa.
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Chamado quando a cena está voltando para o primeiro plano.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Chamado quando a cena entra em segundo plano.
    }
}
