//
//  HotProspectsApp.swift
//  HotProspects
//
//  Created by SAJAN  on 04/10/25.
//

import SwiftData
import SwiftUI

@main
struct HotProspectsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Prospect.self)
    }
}
