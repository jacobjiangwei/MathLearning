//
//  HomeSwiftUIView.swift
//  Pi
//
//  Created by jacob on 2023/9/15.
//

import SwiftUI

struct HomeSwiftUIView: View {
    @EnvironmentObject var appData: AppData

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onAppear() {
                Task {
                    await MathEngine.shared.fetchGrade()
                }
            }
    }
}

struct HomeSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        HomeSwiftUIView()
    }
}
