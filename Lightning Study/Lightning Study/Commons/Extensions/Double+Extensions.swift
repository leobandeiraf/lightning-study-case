import Foundation

extension Double {
    var date: String {
        let date = Date(timeIntervalSince1970: self)
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "pt_BR")
        dateFormatter.dateFormat = "EEEE dd MMM 'às' HH:mm"
        return dateFormatter.string(from: date)
    }
}
