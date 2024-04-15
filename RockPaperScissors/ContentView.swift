import SwiftUI

struct ContentView: View {
    @State var userScore: Int = 0
    @State var cpuScore: Int = 0
    
    @State var roundResult: RoundResult = .beginning
    
    @State var round: Int = 0
    
    var body: some View {
        ZStack {
            VStack {
                Text("Rock Paper Scissors")
                    .font(.largeTitle)
                Spacer()
                VStack(spacing: 12) {
                    ChoiceButton(
                        text: "Rock",
                        icon: "🪨",
                        onClick: {
                            playRound(.rock)
                        }
                    )
                    ChoiceButton(
                        text: "Paper",
                        icon: "📃",
                        onClick: {
                            playRound(.paper)
                        }
                    )
                    ChoiceButton(
                        text: "Scissors",
                        icon: "✂️",
                        onClick: {
                            playRound(.scissors)
                        }
                    )
                }
                Spacer()
                Score(
                    userScore: userScore,
                    cpuScore: cpuScore,
                    roundResult: roundResult
                )
                Spacer()
                VStack {
                    Text("Round "+String(round))
                    RestartButton(
                        onClick: {
                            restart()
                        }
                    )
                }
                Spacer()
            }
            .padding(.horizontal, 12)
        }
    }
    
    func playRound(_ userChoice: Choice) -> Void {
        let cpuChoice = [Choice.rock, Choice.paper, Choice.scissors].randomElement()!
                
        switch (userChoice, cpuChoice) {
            case (.rock, .scissors), (.paper, .rock), (.scissors, .paper):
                userScore += 1
                roundResult = .win
            case (.rock, .paper), (.paper, .scissors), (.scissors, .rock):
                cpuScore += 1
                roundResult = .lose
            default:
                userScore += 1
                cpuScore += 1
                roundResult = .tie
        }
        
        round += 1
    }
    
    func restart() -> Void {
        userScore = 0
        cpuScore = 0
        roundResult = .beginning
        round = 0
    }
}

#Preview {
    ContentView()
}
