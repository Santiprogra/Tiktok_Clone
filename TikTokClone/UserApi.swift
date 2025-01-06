//
//  UserApi.swift
//  TikTokClone
//
//  Created by Santiago Briñez on 4/01/25.
//

import Foundation
import FirebaseAuth
import FirebaseStorage
import FirebaseDatabase
import ProgressHUD

class UserApi {

    func signIn(email: String, password: String, onSuccess: @escaping() -> Void, onError: @escaping(_ errorMessage: String) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { authData, error in
            if error != nil {
                onError(error!.localizedDescription)
                return
            }
            print(authData?.user.uid)
            onSuccess()
        }
    }

    func signUp(withUsername username: String, email: String, password: String, image: UIImage?, onSuccess: @escaping() -> Void, onError: @escaping(_ errorMessage: String) -> Void) {

        guard let imageSelected = image else {
            ProgressHUD.error("Please enter a Profile Image")
            return
        }
        guard let imageData = imageSelected.jpegData(compressionQuality: 0.4) else {return}

        Auth.auth().createUser(withEmail: email, password: password){ authDataResult, error in
            if error != nil {
                print(error!.localizedDescription)
                return
            }
            if let authData = authDataResult {

                var dict: Dictionary<String, Any> = [
                    UID: authData.user.uid,
                    EMAIL: authData.user.email,
                    USERNAME: username,
                    PROFILE_IMAGE_URL: "",
                    STATUS: ""
                ]

                let storageProfileRef = Ref().databaseSpesificProfile(uid: authData.user.uid)

                let metadata = StorageMetadata()
                metadata.contentType = "image/jpg"
                StorageService.savePhoto(username: username, uid: authData.user.uid, data: imageData, metadata: metadata, storageProfileRef: storageProfileRef, dict: dict) {
                    onSuccess()
                } onError: { errorMessage in
                    onError(errorMessage)
                }
            }
        }
    }
}
