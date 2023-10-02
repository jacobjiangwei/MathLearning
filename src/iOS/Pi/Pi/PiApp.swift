//
//  PiApp.swift
//  Pi
//
//  Created by jacob on 2023/9/15.
//

import SwiftUI

@main
struct PiApp: App {
    @StateObject var loaderManager = LoaderManager()

    var body: some Scene {
        WindowGroup {
            ZStack {
                HomeUIView()
                    .environmentObject(MathEngine.shared.appData)
                    .environmentObject(loaderManager)
                if loaderManager.showLoader { LoadingView() }
            }
        }
    }
}
