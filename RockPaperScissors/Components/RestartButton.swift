import SwiftUI

struct RestartButton: View {
    var onClick: () -> Void
    
    var body: some View {
        Button() {
            self.onClick()
        } label: {
            HStack {
                Image(systemName: "arrow.counterclockwise")
                Text("Restart")
            }
            .font(/*@START_MENU_TOKEN@*/.title3/*@END_MENU_TOKEN@*/)
            .padding(.all, 10.0)
        }
        .buttonStyle(.borderedProminent)
    }
}

#Preview {
    RestartButton(
        onClick: {
            print("Restart")
        }
    )
}
