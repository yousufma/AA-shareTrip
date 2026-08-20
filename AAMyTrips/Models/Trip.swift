import Foundation

struct Trip: Identifiable {
    let id: String
    let flightNumber: String
    let confirmationCode: String
    let originCode: String
    let originCity: String
    let destinationCode: String
    let destinationCity: String
    let dateText: String
    let departTimeText: String
    let arriveTimeText: String
    let durationText: String
    let gate: String
    let seat: String
    let status: String
    let imageName: String

    var routeText: String { "\(originCode) → \(destinationCode)" }

    /// Universal link that opens the American Airlines app when installed
    /// (path is claimed in aa.com's apple-app-site-association file).
    var deepLinkURL: URL {
        URL(string: "https://www.aa.com/reservation/view/find-your-trip?recordLocator=\(confirmationCode)")!
    }

    /// Public page whose Open Graph tags carry the destination photo, so the
    /// shared link unfurls with the image on the receiver's phone. The page
    /// links through to `deepLinkURL` to open the AA app.
    var sharePageURL: URL {
        URL(string: "https://yousufma.github.io/aa-trip-links/\(imageName).html")!
    }

    /// Title shown on the link preview card (share sheet and og:title).
    var shareTitle: String { "\(flightNumber) · \(routeText) · \(dateText)" }
}

extension Trip {
    static let sampleTrips: [Trip] = [
        Trip(
            id: "trip-miami",
            flightNumber: "AA 2534",
            confirmationCode: "KXQKWD",
            originCode: "DFW",
            originCity: "Dallas–Fort Worth",
            destinationCode: "MIA",
            destinationCity: "Miami",
            dateText: "Friday, August 14, 2026",
            departTimeText: "7:15 AM",
            arriveTimeText: "11:02 AM",
            durationText: "2h 47m",
            gate: "C15",
            seat: "14A",
            status: "On Time",
            imageName: "miami"
        ),
        Trip(
            id: "trip-losangeles",
            flightNumber: "AA 1187",
            confirmationCode: "MZTPLH",
            originCode: "DFW",
            originCity: "Dallas–Fort Worth",
            destinationCode: "LAX",
            destinationCity: "Los Angeles",
            dateText: "Saturday, September 5, 2026",
            departTimeText: "9:40 AM",
            arriveTimeText: "10:58 AM",
            durationText: "3h 18m",
            gate: "A22",
            seat: "21C",
            status: "On Time",
            imageName: "losangeles"
        ),
        Trip(
            id: "trip-newyork",
            flightNumber: "AA 304",
            confirmationCode: "RBHJCT",
            originCode: "DFW",
            originCity: "Dallas–Fort Worth",
            destinationCode: "JFK",
            destinationCity: "New York",
            dateText: "Thursday, October 22, 2026",
            departTimeText: "5:25 PM",
            arriveTimeText: "9:48 PM",
            durationText: "3h 23m",
            gate: "D34",
            seat: "8F",
            status: "On Time",
            imageName: "newyork"
        ),
    ]
}
