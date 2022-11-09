//
//  ParameterEncoding.swift
//  NetworkLayers
//
//  Created by Chioma Amanda Mmegwa  on 26/10/2022.
//

import Foundation

public enum NetworkError: String, Error {
    case parameterNil = "Parameters were nil"
    case encodingFailed = "Parameters encoding failed"
    case missingURL = "URL is nil"
}

public typealias Parameters = [String: Any]
protocol ParameterEncoder {
    static func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws
}
