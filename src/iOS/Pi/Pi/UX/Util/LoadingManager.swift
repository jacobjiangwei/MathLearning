//
//  LoadingManager.swift
//  Pi
//
//  Created by jacob on 2023/10/2.
//

import Foundation
import SwiftUI

class LoaderManager: ObservableObject {
    @Published var showLoader = false
}

struct LoadingView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.black)
                .opacity(0.75)
                .ignoresSafeArea()
            VStack(spacing: 20) {
                ProgressView()
                Text("Loading...")
            }
            .background {
                RoundedRectangle(cornerRadius: 20)
                .fill(.white)
                .frame(width: 120, height: 120)
            }
            .offset(y: -70)
        }
    }
}


