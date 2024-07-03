import Foundation

protocol NativeRequestType {
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var method: NewHTTPMethod { get }
    var headers: [String: String] { get }
    var params: [String: Any]? { get }
}

extension NativeRequestType {
    var scheme: String {
        "https"
    }
    
    var host: String {
        "mempool.space"
    }
    
    var headers: [String: String] {
        HeaderBuilder.basic.build()
    }
    
    var params: [String: Any]? {
        nil
    }
}
