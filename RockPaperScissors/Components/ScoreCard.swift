import SwiftUI

struct ScoreCard: View {
    var player: String
    var score: Int
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack {
            Text(self.player)
                .padding(.bottom, 10.0)
            
            Text(String(self.score))
                .font(.largeTitle)
        }
        .padding(.horizontal, 30)
        .padding(.vertical, 20)
        .background(Rectangle()
            .foregroundColor(colorScheme == .dark ? .black : .white)
            .cornerRadius(10)
            .shadow(
                color: .primary,
                radius: 3
            )
        )
    }
}

#Preview {
    ScoreCard(player: "You", score: 10)
}
