import SwiftUI

struct ChoiceButton: View {
    var text: String
    var icon: String
    var onClick: () -> Void
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        Button() {
            self.onClick()
        } label: {
            HStack {
                Spacer()
                Text(self.icon)
                Text(self.text)
                    .foregroundColor(colorScheme == .dark ? .white : .black)
                Spacer()
            }
            .font(/*@START_MENU_TOKEN@*/.title3/*@END_MENU_TOKEN@*/)
            .padding(.all, 10.0)
        }
        .buttonStyle(.bordered)
        .foregroundColor(.black)
    }
}

#Preview {
    ChoiceButton(
        text: "Rock",
        icon: "🪨",
        onClick: {
            print("Clicked button")
        }
    )
    .padding(.horizontal, 12.0)
}
