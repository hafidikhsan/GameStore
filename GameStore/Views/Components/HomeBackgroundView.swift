import SwiftUI

struct HomeBackgroundView: View {
    @Binding var zoomValue: CGFloat
    var body: some View {
        ZStack {
            Color("PrimaryColor")
            Circle()
                .fill(Color("SecondaryColor"))
                .frame(width: abs(zoomValue + 300), height: abs(zoomValue + 300))
                .position(x: 380, y: 50)
            Circle()
                .fill(Color("SecondaryColor"))
                .frame(width: abs(zoomValue + 200), height: abs(zoomValue + 200))
                .position(x: 0, y: 300)
        }
        .frame(height: 300)
    }
}

struct HomeBackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        HomeBackgroundView(zoomValue: .constant(0.0))
    }
}
