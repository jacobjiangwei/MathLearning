//
//  HomeUIView.swift
//  Pi
//
//  Created by jacob on 2023/9/25.
//

import SwiftUI

struct HomeUIView: View {
    @EnvironmentObject var appData: AppData

    var body: some View {
        if appData.showGradeList {
            NavigationView {
                List(KeyCenter.grades) { grade in
                    Button(action: {
                        print("clicked \(grade)")
                        Task {
                            await MathEngine.shared.fetchGrade(url: grade.url)
                        }
                    }, label: {
                        Text(grade.name)
                    })
                    .buttonStyle(.plain)
                }
                .navigationTitle("Select Grade")
            }
        }
        else {
            GradeUIView()
                .environmentObject(MathEngine.shared.appData)
        }
    }
}

#Preview {
    HomeUIView()
}
