import Foundation

protocol HTTPProtocol {
    func request<Model: Decodable>(
        service: NativeRequestType,
        with model: Model.Type?,
        completion: @escaping (Result<Model?, HTTPError>) -> Void
    )
    
    func cancel(completion: (() -> Void)?)
}
