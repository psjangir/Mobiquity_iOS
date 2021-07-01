//
//  WebServiceProtocol.swift
//  Mobiquity_iOS
//
//  Created by Pavan on 27/06/21.
//

import Foundation
 protocol WebServiceProtocol
{
    func SuccessResponse(_ json : Codable)
    
    func ErrorResponse(_ error : NSError)
}
