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


import Foundation;
import MedKitCore;


/**
 PublicKeyCredentials factory.
 */
public class PublicKeyCredentialsFactory: CredentialsFactory {
    
    // MARK: - Class Properties
    static let shared = PublicKeyCredentialsFactory();
    
    // MARK: - Instantiation
    
    /**
     Create credentials from profile.
     */
    public func instantiate(from profile: JSON, for identity: Identity) -> Credentials?
    {
        if let string = profile[KeyCertificateChain].string {
            if let data = Data(base64Encoded: string) {
                return SecurityManagerShared.main.loadPublicCredentials(for: identity, from: data);
            }
        }
        
        return nil;
    }
    
}


// End of File