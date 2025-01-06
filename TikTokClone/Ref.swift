//
//  Ref.swift
//  TikTokClone
//
//  Created by Santiago Briñez on 4/01/25.
//

import Foundation
import FirebaseDatabase
import FirebaseStorage

let REF_USER = "users"
let STORAGE_PROFILE = "profile"
let URL_STORAGE_ROOT = "/URL/"
let EMAIL = "email"
let UID = "uid"
let USERNAME = "username"
let PROFILE_IMAGE_URL = "profileImageUrl"
let STATUS = "status"

class Ref {
    let databeseRoot = Database.database().reference()

    var databaseUsers : DatabaseReference {
        return databeseRoot.child(REF_USER)
    }

    func databaseSpesificUser(uid: String) -> DatabaseReference {
        return databaseUsers.child(uid)
    }

//Storage Ref

    let storageRoot = Storage.storage().reference(forURL: URL_STORAGE_ROOT)

    var storageProfile: StorageReference {
        return storageRoot.child(STORAGE_PROFILE)
    }

    func databaseSpesificProfile(uid : String) -> StorageReference {
        return storageProfile.child(uid)
    }
}
