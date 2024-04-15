import SwiftUI

struct Score: View {
    var userScore: Int
    var cpuScore: Int
    
    var roundResult: RoundResult
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        Text(getMessage())
            .foregroundColor(getColor())
        
        HStack {
            Spacer()
            ScoreCard(
                player: "You",
                score: userScore
            )
            Spacer()
            ScoreCard(
                player: "CPU",
                score: cpuScore
            )
            Spacer()
        }
    }
    
    func getColor() -> Color {
        if roundResult == .win {
            return Color.green
        }
        else if roundResult == .lose {
            return Color.red
        }
            
        return colorScheme == .dark ? Color.white : Color.black
    }
    
    func getMessage() -> String {
        if roundResult == .win {
            return "You won"
        }
        else if roundResult == .lose {
            return "You lost"
        }
        else if roundResult == .tie {
            return "It was tie"
        }
        
        return " "
    }
}

#Preview {
    Score(
        userScore: 3,
        cpuScore: 2,
        roundResult: .win
    )
}
