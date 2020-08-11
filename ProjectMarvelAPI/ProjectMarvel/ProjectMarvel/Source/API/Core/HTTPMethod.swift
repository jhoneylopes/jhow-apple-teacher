public enum HTTPMethod: String {
    case get
    
    public var name: String {
        return rawValue.uppercased()
    }
}
