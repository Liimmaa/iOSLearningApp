//
//  HTTPTask.swift
//  NetworkLayers
//
//  Created by Chioma Amanda Mmegwa  on 26/10/2022.
//

import Foundation

public typealias HTTPHeaders = [String: String]

public enum HTTPTask {
    case request
    case requestParameters(bodyParameters: Parameters?,
                           urlParameters: Parameters?)
    case requestParametersAndHeaders(bodyParameters: Parameters?,
                                     urlParameters: Parameters?,
                                     additionalHeaders: HTTPHeaders?)
}
