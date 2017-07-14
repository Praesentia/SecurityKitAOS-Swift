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


import CommonCrypto
import Foundation
import SecurityKit


/**
 SHA384 digest.
 */
class SHA384: Digest {
    
    // MARK: - Private Properties
    private var context = CC_SHA512_CTX()
    
    // MARK: - Initializers
    
    public init()
    {
        CC_SHA384_Init(&context)
    }
    
    // MARK: -
    
    public func reset()
    {
        CC_SHA384_Init(&context)
    }
    
    public func final() -> [UInt8]
    {
        var digest = [UInt8](repeating: 0, count: Int(CC_SHA384_DIGEST_LENGTH))
        
        CC_SHA384_Final(&digest, &context)
        CC_SHA384_Init(&context)
        
        return digest
    }
    
    public func update(bytes: [UInt8])
    {
        CC_SHA384_Update(&context, bytes, CC_LONG(bytes.count))
    }
    
}


// End of File
