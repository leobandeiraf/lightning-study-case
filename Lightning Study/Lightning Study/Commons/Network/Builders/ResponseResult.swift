import Foundation

enum ResponseResult<Model> {
    case success(Model), error(HTTPError)
}
