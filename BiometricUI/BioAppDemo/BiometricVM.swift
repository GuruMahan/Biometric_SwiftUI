//
//  BiometricVM.swift
//  BiometricUI
//
//  Created by Guru Mahan on 18/01/23.
//

import UIKit

class BiometricVM: ObservableObject {
    @Published var faces: [FaceBiomatricModel] = []
    @Published var isLoaderShown: Bool = false
    var userId: String = ""
    let uploadType: BiometricType
    
       init(faces: [FaceBiomatricModel], userId: String, uploadType: BiometricType) {
        self.faces = faces
        self.userId = userId
        self.uploadType = uploadType
//
//        if faces.isEmpty {
//            getBiometricDetails { result in
//                for item in BiomatricModel().data?.biometricUploaded ?? [] {
//                    self.faces.append(BiomatricModel(image: nil, url: item.url ?? "", signedUrl: item.sigenedURL))
//                }
//
//            }
//        }

    }
    var row: Int {
        return (faces.count / 2) + (faces.count % 2 == 0 ? 0:1)
    }
    
    func coluimn(row: Int) -> Int {
        if row == (self.row - 1) {
            return faces.count % 2 == 0 ? 2 : 1
            
        }else {
            return 2
        }
    }
    
    func getFace(row: Int, column: Int) -> UIImage? {
        let index = (row * 2) + column
        return faces[index].image
    }
    
    func getSignedUrl(row: Int, column: Int) -> String{
        let index = (row * 2) + column
        return faces[index].signedUrl
    }
    
    func removeFace(row: Int, column: Int) {
        let index = (row * 2) + column
        faces.remove(at: index)
    }
    
    func submitFace(completion: @escaping((Bool) -> Void)) {
        let faceUrls = faces.map { $0.url }
        var param: [String: Any] = ["updateObject": faceUrls, "flagged": "false"]
        if uploadType == .update {
         //   param["flagged" = true]
            param["edited"] = true
        }
        isLoaderShown = true
     //   callUpdateBiomatric(param: param) { result in
        //    self.isLoaderShown = false
           // completion(result?.m)
      //  }
    }
}

extension BiometricVM {
    
    func getBiometricDetails(finished: @escaping () -> Void) {
        
    //    let getDocument = "users/users-biometric-upload/\(userId)"
        
//        HttpService.shared.get(url: getDocument,
//                               resultType:nil,
//                               ignoreTokenCheck: true,
//                               onCompletion: { result, _ in
//            DispatchQueue.main.async {
//                finished(result)
//            }
//        })
    }
    
    func callUpdateBiomatric(param: [String: Any], onCompletion finished: @escaping () -> Void) {
//        let updateDocument = "users/users-biometric-upload/\(userId)"
//        HttpService.shared.put(url: updateDocument,
//                               body: param,
//                               resultType: nil,
//                               ignoreTokenCheck: true,
//                               onCompletion: { result, _ in
//            DispatchQueue.main.async {
//                finished(result)
//            }
//        })
    }
}
