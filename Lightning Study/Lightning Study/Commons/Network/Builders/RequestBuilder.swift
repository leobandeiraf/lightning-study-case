import Foundation

enum RequestBuilder {
    static func build(from service: NativeRequestType) -> URLRequest? {
        var components = URLComponents()
        components.scheme = service.scheme
        components.host = service.host
        components.path = service.path

        if let paramsUnwrapped = service.params, let params = paramsUnwrapped as? [String: String], service.method == .get {
            components.queryItems = params.map({ key, value in
                return URLQueryItem(name: key, value: value)
            })
        }
        
        guard let url = NSString(string: components.url?.absoluteString ?? "").removingPercentEncoding else {
            return nil
        }
        
        var headers = HeaderBuilder.basic.build()
        headers.merge(service.headers) { current, _ in
            current
        }
        
        var urlReq: URL?
        if let reqURL = URL(string: url) {
            urlReq = reqURL
        } else {
            urlReq = URL(string: url.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!)
        }
        
        var request = URLRequest(url: urlReq!)
        request.allHTTPHeaderFields = headers
        request.httpMethod = service.method.rawValue
        if let params = service.params, service.method == .patch || service.method == .post || service.method == .put {
            
            let encoder = try! JSONSerialization.data(withJSONObject: params as Any, options: .prettyPrinted)
            request.httpBody = encoder
        }

        return request
    }
}
