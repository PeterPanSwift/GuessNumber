import Foundation

class ViewModel: ObservableObject {
    @Published var randomNumber: Int = Int.random(in: 1...100)
    @Published var resultMessage: String = ""
    
    func generateNewRandomNumber() {
        randomNumber = Int.random(in: 1...100)
    }
    
    func checkGuess(_ guess: Int) {
        if guess == randomNumber {
            resultMessage = "Congratulations! You guessed the number."
            generateNewRandomNumber()
        } else if guess < randomNumber {
            resultMessage = "Too low! Try again."
        } else {
            resultMessage = "Too high! Try again."
        }
    }
}
