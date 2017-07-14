/*
 -----------------------------------------------------------------------------
 This source file is part of MedKitSecurity.
 
 Copyright 2017 Jon Griffeth
 
 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at
 
 http://www.apache.org/licenses/LICENSE-2.0
 
 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 -----------------------------------------------------------------------------
 */


import Foundation
import SecurityKit


extension SecIdentity {
    
    /**
     Load certificate.
     */
    static func find(for id: Identity, searchList: [SecKeychain]?) -> SecIdentity?
    {
        var query: [CFString : Any] = [
            kSecClass      : kSecClassIdentity,
            kSecReturnRef  : kCFBooleanTrue,
            kSecMatchLimit : kSecMatchLimitAll
        ]
        
        if let searchList = searchList {
            query[kSecMatchSearchList] = searchList
        }
        
        var result: AnyObject?
        var status: OSStatus
        
        status = SecItemCopyMatching(query as CFDictionary, &result)
        if status != errSecSuccess {
            return nil
        }
        
        if let array = result as? [SecIdentity] {
            for identity in array {
                if identity.certificate?.commonName == id.string {
                    return identity
                }
            }
        }
        
        return nil
    }
    
}


// End of File
