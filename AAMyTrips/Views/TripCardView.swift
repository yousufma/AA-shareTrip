import SwiftUI

struct TripCardView: View {
    let trip: Trip

    var body: some View {
        VStack(spacing: 0) {
            imageHeader
            details
        }
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
        .shadow(color: .black.opacity(0.12), radius: 8, y: 3)
    }

    private var imageHeader: some View {
        ZStack(alignment: .bottomLeading) {
            Image(trip.imageName)
                .resizable()
                .scaledToFill()
                .frame(height: 150)
                .frame(maxWidth: .infinity)
                .clipped()

            LinearGradient(
                colors: [.clear, .black.opacity(0.55)],
                startPoint: .center,
                endPoint: .bottom
            )

            VStack(alignment: .leading, spacing: 2) {
                Text(trip.destinationCity)
                    .font(.title2.bold())
                    .foregroundStyle(.white)
                Text(trip.dateText)
                    .font(.footnote)
                    .foregroundStyle(.white.opacity(0.9))
            }
            .padding(12)

            statusPill
                .padding(10)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
        }
        .frame(height: 150)
    }

    private var statusPill: some View {
        Text(trip.status)
            .font(.caption.bold())
            .foregroundStyle(.white)
            .padding(.horizontal, 10)
            .padding(.vertical, 4)
            .background(Color.green.opacity(0.9), in: Capsule())
    }

    private var details: some View {
        VStack(spacing: 14) {
            HStack {
                Text("Confirmation: ")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                + Text(trip.confirmationCode)
                    .font(.subheadline.bold())
                    .foregroundStyle(Color.aaBlue)
                Spacer()
                Text(trip.flightNumber)
                    .font(.subheadline.bold())
                    .foregroundStyle(Color.aaDarkBlue)
            }

            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 2) {
                    Text(trip.originCode)
                        .font(.system(size: 30, weight: .bold))
                        .foregroundStyle(Color.aaDarkBlue)
                    Text(trip.originCity)
                        .font(.caption)
                        .foregroundStyle(.secondary)
                    Text(trip.departTimeText)
                        .font(.subheadline.weight(.semibold))
                }

                Spacer()

                VStack(spacing: 4) {
                    Image(systemName: "airplane")
                        .foregroundStyle(Color.aaBlue)
                    Text(trip.durationText)
                        .font(.caption2)
                        .foregroundStyle(.secondary)
                }
                .padding(.top, 8)

                Spacer()

                VStack(alignment: .trailing, spacing: 2) {
                    Text(trip.destinationCode)
                        .font(.system(size: 30, weight: .bold))
                        .foregroundStyle(Color.aaDarkBlue)
                    Text(trip.destinationCity)
                        .font(.caption)
                        .foregroundStyle(.secondary)
                    Text(trip.arriveTimeText)
                        .font(.subheadline.weight(.semibold))
                }
            }

            Divider()

            HStack(spacing: 16) {
                Label("Gate \(trip.gate)", systemImage: "door.left.hand.open")
                    .font(.caption)
                    .foregroundStyle(.secondary)
                Label("Seat \(trip.seat)", systemImage: "carseat.left.fill")
                    .font(.caption)
                    .foregroundStyle(.secondary)
                Spacer()
                shareButton
            }
        }
        .padding(14)
    }

    private var shareButton: some View {
        Button {
            shareTrip()
        } label: {
            Label("Share trip", systemImage: "square.and.arrow.up")
                .font(.subheadline.weight(.semibold))
                .foregroundStyle(Color.aaBlue)
        }
        .buttonStyle(.plain)
    }

    @MainActor
    private func shareTrip() {
        guard let image = UIImage(named: trip.imageName) else { return }

        guard let scene = UIApplication.shared.connectedScenes
            .compactMap({ $0 as? UIWindowScene })
            .first(where: { $0.activationState == .foregroundActive }),
            let rootViewController = scene.keyWindow?.rootViewController
        else { return }

        var presenter = rootViewController
        while let presented = presenter.presentedViewController {
            presenter = presented
        }

        let activityViewController = UIActivityViewController(
            activityItems: [TripShareItemSource(image: image, trip: trip)],
            applicationActivities: nil
        )
        // iPad presents the share sheet as a popover and needs an anchor.
        activityViewController.popoverPresentationController?.sourceView = presenter.view
        activityViewController.popoverPresentationController?.sourceRect = CGRect(
            x: presenter.view.bounds.midX, y: presenter.view.bounds.midY, width: 0, height: 0
        )
        presenter.present(activityViewController, animated: true)
    }
}

#Preview {
    TripCardView(trip: Trip.sampleTrips[0])
        .padding()
        .background(Color.aaBackground)
}
