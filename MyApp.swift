import SwiftUI

@main
struct MyApp: App {

    // holds global game options like difficulty and animations
    @StateObject var settings = GameSettings()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(settings)
        }
    }
}
