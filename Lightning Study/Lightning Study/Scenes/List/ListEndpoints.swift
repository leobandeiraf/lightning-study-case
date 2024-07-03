enum ListEndpoints: NativeRequestType {
    case nodes
    
    var path: String {
        "/api/v1/lightning/nodes/rankings/connectivity"
    }
    
    var method: NewHTTPMethod {
        .get
    }
}
