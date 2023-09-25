//
//  AppData.swift
//  Pi
//
//  Created by jacob on 2023/9/18.
//

import Foundation
import Combine

class AppData: ObservableObject {
    @Published var selectedGrade: Grade!
    @Published var showGradeList = true
}
