//
//  SelectGradeUIView.swift
//  Pi
//
//  Created by jacob on 2023/9/24.
//

import SwiftUI

struct SelectGradeUIView: View {
    var body: some View {
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
}

#Preview {
    SelectGradeUIView()
}
