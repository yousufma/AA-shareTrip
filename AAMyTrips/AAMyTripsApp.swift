import SwiftUI

@main
struct AAMyTripsApp: App {
    var body: some Scene {
        WindowGroup {
            MyTripsView()
        }
    }
}

extension Color {
    static let aaBlue = Color(red: 0 / 255, green: 120 / 255, blue: 210 / 255)
    static let aaDarkBlue = Color(red: 0 / 255, green: 70 / 255, blue: 127 / 255)
    static let aaRed = Color(red: 195 / 255, green: 0 / 255, blue: 25 / 255)
    static let aaBackground = Color(red: 237 / 255, green: 239 / 255, blue: 240 / 255)
}
