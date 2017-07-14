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


import XCTest
@testable import MedKitSecurity


/**
 HMACSHA1 Tests
 
 - See Also:
    RFC 2202
 */
class HMACSHA1Tests: XCTestCase {
    
    let data   = [UInt8](hexString: "4869205468657265")! // "Hi There"
    let key    = [UInt8](hexString: "0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b")!
    let value  = [UInt8](hexString: "b617318655057264e28bc0b6fb378c8ef146be00")!
    
    /**
     - Remark:
     Only confirms that the correct algorithm is being used.
     */
    func testCorrectAlgorithm()
    {
        let hmac      = HMACSHA1()
        var signature : [UInt8]
        
        signature = hmac.sign(bytes: data, using: key)
        
        XCTAssert(signature == value)
    }
    
}


// End of File
