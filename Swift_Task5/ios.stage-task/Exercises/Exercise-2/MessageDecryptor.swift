import UIKit

class MessageDecryptor: NSObject {
    
    func decryptMessage(_ message: String) -> String {
        var numArr = [String]()
        var strArr = [String]()
        var modifiedMessage = ""
        
        if message[message.startIndex] == "0" {
            return ""
        }
        for char in message {
            if char.isNumber {
                numArr.append(String(char))
            }
            if char == "[" {
                if numArr.isEmpty {
                    numArr.append("1")
                }
                strArr.append(modifiedMessage)
                modifiedMessage = ""
            }
            if char == "]" {
                var tempStr = ""
                if let num = Int(numArr.popLast() ?? "1") {
                    for _ in 0..<num {
                        tempStr += modifiedMessage
                    }
                }
                guard let tempStr2 = strArr.popLast() else { return "" }
                modifiedMessage = tempStr2 + tempStr
            }
            if char.isLetter {
                modifiedMessage += String(char)
            }
        }
        return modifiedMessage
        
    }
}

