
import Foundation

class ArDigitHelper {
    public static func toArDigit(value: String) -> String {
        var finalString: String = value
        finalString = finalString.replacingOccurrences(of: "0", with: "٠")
        finalString = finalString.replacingOccurrences(of: "1", with: "١")
        finalString = finalString.replacingOccurrences(of: "2", with: "٢")
        finalString = finalString.replacingOccurrences(of: "3", with: "٣")
        finalString = finalString.replacingOccurrences(of: "4", with: "٤")
        finalString = finalString.replacingOccurrences(of: "5", with: "٥")
        finalString = finalString.replacingOccurrences(of: "6", with: "٦")
        finalString = finalString.replacingOccurrences(of: "7", with: "٧")
        finalString = finalString.replacingOccurrences(of: "8", with: "٨")
        finalString = finalString.replacingOccurrences(of: "9", with: "٩")
        return finalString
    }
}

public extension String {
    func toArDigit() -> String { ArDigitHelper.toArDigit(value: self) }
}

public extension Int {
    func toArDigit() -> String { ArDigitHelper.toArDigit(value: String(self)) }
}

public extension Double {
    func toArDigit() -> String { ArDigitHelper.toArDigit(value: String(self)) }
}