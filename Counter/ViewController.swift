import UIKit

final class ViewController: UIViewController {
    private var counter: Int = 0
    @IBOutlet weak var plusOneButton: UIButton!
    @IBOutlet weak var counterTextView: UILabel!
    @IBOutlet weak var minusOneButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var historyTextView: UITextView!
    
    private var currentDate: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        currentDate = getDate()
        updateTextView()
        historyTextView.text = "История изменений"
    }
    
    @IBAction func plusButton(_ sender: Any) {
        counter += 1
        updateTextView()
        updateHistory(text: " значение изменено на +1")
    }
    
    @IBAction func minusButton(_ sender: Any) {
        if counter > 0 {
            counter -= 1
            updateTextView()
            updateHistory(text: " значение изменено на -1")
        } else {
            updateHistory(text: " попытка уменьшить значение счетчика ниже 0")
        }
    }
    
    @IBAction func resetActionButton(_ sender: Any) {
        counter = 0
        updateTextView()
        updateHistory(text: " значение сброшено")
    }
    
    private func updateTextView(){
        counterTextView.text = String(counter)
    }
    
    private func updateHistory(text: String) {
        historyTextView.text += "\n\(currentDate)\(text)"
        let range = NSMakeRange(historyTextView.text.count - 1, 0)
        historyTextView.scrollRangeToVisible(range)
    }
    
    private func getDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm"
        let currentDate = Date()
        let dateString = dateFormatter.string(from: currentDate)
        return dateString
    }
}
