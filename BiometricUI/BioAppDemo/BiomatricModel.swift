//
//  BiomatricModel.swift
//  BiometricUI
//
//  Created by Guru Mahan on 18/01/23.
//

import Foundation
import UIKit

struct BiomatricModel {
    let message: String?
    let data: DataClass?
   
}
    struct DataClass {
        let biometricUploaded: [BiometricUploaded]?
        let flag: Bool?
        let edit: Bool?
    }
    
    
    struct BiometricUploaded{
        let url: String?
        let sigenedURL: String?
        
        enum CodingKeys: String, CodingKey {
            case url
            case signedURL = "signedUrl"
       
        }

    }
struct FaceBiomatricModel {
    let image: UIImage?
    let url: String
    var signedUrl: String = ""
}
enum BiometricType {
    case new
    case update
    case profile
}
