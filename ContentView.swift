import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            MainView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }

            MemoryGameView()
                .tabItem {
                    Label("Game", systemImage: "gamecontroller")
                }
            
            OptionsView()
                .tabItem {
                    Label("Options", systemImage: "gearshape")
                }
            
        }
    }
}
