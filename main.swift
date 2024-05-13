let arr = ["elma", "armut", "ananas", "kiraz", "muz", "üzüm", "karpuz", "kavun", "çilek", "erik", "portakal", "mandalina"]

func startGame() -> String {
    let randomIndex = Int.random(in: 0..<arr.count)
    let selectedWord = arr[randomIndex]
    print("🍒Meyve Bulmaca Oyununa Hoşgeldiniz.Meyveleri tahmin etmelisiniz. Tahmin Edemezseniz elenirsiniz.🍒")
    return selectedWord
}

func showInitialState(word: String, remainingAttempts: Int) {
    let underscoredWord = String(repeating: "_ ", count: word.count)
    print("Kelimeniz: \(underscoredWord)")
    print("Kalan deneme hakkınız: \(remainingAttempts)")
}

func takeGuess(word: String, findLetters: inout [Character], remainingAttempts: Int) -> Bool {
    var guessedWord = ""
    var allLettersGuessed = true 
    for letter in word {
        if findLetters.contains(letter) {
            guessedWord += "\(letter) "
        } else {
            guessedWord += "_ "
            allLettersGuessed = false
        }
    }
    print("Tahmin: \(guessedWord)")
    print("Kalan deneme hakkınız: \(remainingAttempts)")
    
    print("Tahmin etmek istediğiniz harfi veya kelimeyi girin: ")
    if let prediction = readLine()?.lowercased() {
        if prediction.count == 1, let findLetter = prediction.first {
            if word.contains(findLetter) {
                print("Tebrikler! \(findLetter) harfini doğru buldunuz. Geriye kalanlar ne olabilir🤔")
                if !findLetters.contains(findLetter) {
                    findLetters.append(findLetter)
                }
            } else {
                print("Üzgünüz, \(findLetter) harfi yanlis. Tekrar deneyebilirsin")
            }
        } else {
            
            if prediction == word {
                print("Tebrikler dogru cevapladiniz")
                return true
            } else {
                print(" maalesef yanlis tahmin ettin☹️")
            }
        }
    }
    return allLettersGuessed 
}

var currentWord = startGame()

let maxAttempts = 5
showInitialState(word: currentWord, remainingAttempts: maxAttempts)

var findLetters: [Character] = []
var remainingAttempts = maxAttempts
while remainingAttempts > 0 {
    if takeGuess(word: currentWord, findLetters: &findLetters, remainingAttempts: remainingAttempts) {
        break
    }
    remainingAttempts -= 1
}
print("Game Over")
