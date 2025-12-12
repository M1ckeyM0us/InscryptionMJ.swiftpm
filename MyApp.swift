import SwiftUI

@main
struct MyApp: App {
    @StateObject var settings = GameSettings()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(settings)
        }
    }
}
