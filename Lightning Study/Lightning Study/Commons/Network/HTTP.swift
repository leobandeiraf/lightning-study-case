import Foundation

class HTTP: HTTPProtocol {
    private var requestTask: URLSessionDataTaskProtocol?
    private var session: URLSessionProtocol
    private var config: URLSessionConfiguration = {
        let config = URLSessionConfiguration()
        return config
    }()
    
    init(session: URLSessionProtocol = URLSession.shared,
         requestTask: URLSessionDataTaskProtocol? = nil) {
        self.session = session
        self.requestTask = requestTask
    }
    
    func request<Model: Decodable>(
        service: NativeRequestType,
        with model: Model.Type?,
        completion: @escaping (Result<Model?, HTTPError>) -> Void) {
            guard let service = RequestBuilder.build(from: service) else {
                completion(.failure(.noData))
                return
            }
            
            guard ConnectionCheck.isConnectedToNetwork() else {
                completion(.failure(.noInternet))
                return
            }
            
            requestTask = session.dataTask(with: service, completionHandler: { (data, response, error) in
                do {
                    guard let data = data, let response = response as? HTTPURLResponse else {
                        completion(.failure(.unknown))
                        return
                    }
                    
                    try ErrorResponseBuilder.build(from: response, error: error, data: data)
                    if response.statusCode == 204 {
                        completion(.success(nil))
                        return
                    }
                    
                    let object = try HTTPDecodeBuilder.build(from: data,
                                                             objectType: Model.self)
                    
                    completion(.success(object))
                    self.prettyPrint(service: service, data: data)
                } catch {
                    let error = error as! HTTPError
                    completion(.failure(error))
                    self.prettyPrint(service: service, data: nil)
                }
            })
            requestTask?.resume()
        }
    
    private func prettyPrint(service: URLRequest, data: Data?) {
        
        debugPrint("===================== REQUEST =====================")
        debugPrint("===> URL: \(service.url?.absoluteString ?? "")")
        let httpMethod = service.httpMethod
        debugPrint("===> Method: \(service.httpMethod ?? "")")
        debugPrint("===> Headers: \(String(describing: service.allHTTPHeaderFields ?? [:]))")
        
        if let httpMethod = httpMethod, httpMethod == "POST" || httpMethod == "PATCH" {
            debugPrint("===> Requested BODY: \(String(describing: service.httpBody))")
        }
        
        guard let data = data, let json = try? JSONSerialization.jsonObject(with: data, options: []) else { return }
        debugPrint("===> Response")
        let jsonData = try! JSONSerialization.data(withJSONObject: json, options: [])
        debugPrint(String(data: jsonData, encoding: .utf8) ?? "")
        debugPrint("====================================================")
    }
    
    func cancel(completion: (() -> Void)?) {
        requestTask?.cancel()
        URLSession.shared.getAllTasks { tasks in
            if tasks.count > 0 {
                _ = tasks.map { $0.cancel() }
            }
            completion?()
        }
    }
}
