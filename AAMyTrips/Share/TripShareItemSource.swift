import LinkPresentation
import UIKit

/// Shares the trip's public page URL. That page's Open Graph tags carry the
/// destination photo, so the link unfurls as an image card on the receiver's
/// phone and clicks through to the AA app deep link. The LPLinkMetadata here
/// only styles the sender's share sheet preview.
final class TripShareItemSource: NSObject, UIActivityItemSource {
    private let image: UIImage
    private let trip: Trip

    init(image: UIImage, trip: Trip) {
        self.image = image
        self.trip = trip
    }

    func activityViewControllerPlaceholderItem(_ activityViewController: UIActivityViewController) -> Any {
        trip.sharePageURL
    }

    func activityViewController(
        _ activityViewController: UIActivityViewController,
        itemForActivityType activityType: UIActivity.ActivityType?
    ) -> Any? {
        trip.sharePageURL
    }

    func activityViewController(
        _ activityViewController: UIActivityViewController,
        subjectForActivityType activityType: UIActivity.ActivityType?
    ) -> String {
        "\(trip.flightNumber) · \(trip.routeText) · \(trip.dateText)"
    }

    func activityViewControllerLinkMetadata(_ activityViewController: UIActivityViewController) -> LPLinkMetadata? {
        let metadata = LPLinkMetadata()
        metadata.title = trip.shareTitle
        metadata.originalURL = trip.sharePageURL
        metadata.imageProvider = NSItemProvider(object: image)
        metadata.iconProvider = NSItemProvider(object: image)
        return metadata
    }
}
