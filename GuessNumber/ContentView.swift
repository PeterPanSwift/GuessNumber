import SwiftUI

struct ContentView: View {
    @State private var userInput: String = ""
    @State private var resultMessage: String = ""
    @State private var randomNumber: Int = Int.random(in: 1...100)
    
    var body: some View {
        Form {
            Section(header: Text("Guess the Number")) {
                TextField("Enter your guess", text: $userInput)
                    .keyboardType(.numberPad)
                Button(action: {
                    checkGuess()
                }) {
                    Text("Submit")
                }
                Text(resultMessage)
            }
        }
    }
    
    private func checkGuess() {
        guard let guess = Int(userInput) else {
            resultMessage = "Please enter a valid number."
            return
        }
        
        if guess == randomNumber {
            resultMessage = "Congratulations! You guessed the number."
            randomNumber = Int.random(in: 1...100)
        } else if guess < randomNumber {
            resultMessage = "Too low! Try again."
        } else {
            resultMessage = "Too high! Try again."
        }
    }
}

#Preview {
    ContentView()
}
