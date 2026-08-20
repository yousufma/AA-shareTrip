import SwiftUI

struct MyTripsView: View {
    var body: some View {
        ZStack {
            Color.aaBackground.ignoresSafeArea()

            VStack(spacing: 0) {
                header

                ScrollView {
                    LazyVStack(spacing: 16) {
                        ForEach(Trip.sampleTrips) { trip in
                            TripCardView(trip: trip)
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 20)
                }
            }
        }
    }

    private var header: some View {
        ZStack {
            LinearGradient(
                colors: [.aaDarkBlue, .aaBlue],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea(edges: .top)

            HStack(alignment: .bottom) {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Hello, World 👋")
                        .font(.subheadline)
                        .foregroundStyle(.white.opacity(0.85))
                    Text("My trips")
                        .font(.system(size: 32, weight: .bold))
                        .foregroundStyle(.white)
                }
                Spacer()
                Image(systemName: "airplane")
                    .font(.system(size: 26, weight: .semibold))
                    .foregroundStyle(.white)
                    .rotationEffect(.degrees(-45))
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 16)
            .frame(maxHeight: .infinity, alignment: .bottom)
        }
        .frame(height: 96)
    }
}

#Preview {
    MyTripsView()
}
