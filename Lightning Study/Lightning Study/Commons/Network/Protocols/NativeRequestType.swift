import Foundation

protocol NativeRequestType {
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var method: NewHTTPMethod { get }
    var headers: [String: String] { get }
    var params: [String: Any]? { get }
    var context: RequestContext { get }
}

extension NativeRequestType {
    var scheme: String {
        "https"
    }
    
    var host: String {
        switch context {
        case .sabin:
            #if DEVELOPMENT
            let nativeURL: String = "apidev.cloudsabin.com"
            return nativeURL
            #elseif PRODUCTION
            let nativeURL: String = "api.sabin.com.br"
            return nativeURL
            #else
            let nativeURL: String = "api-staging.cloudsabin.com"
            return nativeURL
            #endif
        case .vaccineMarket:
            return "apidev-loja.cloudsabin.com"
        }
    }
    
    var headers: [String: String] {
        return HeaderBuilder.basic.build()
    }
    
    var params: [String: Any]? {
        nil
    }
}

enum RequestContext {
    case sabin
    case vaccineMarket
}
