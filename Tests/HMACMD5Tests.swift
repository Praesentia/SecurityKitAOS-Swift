/*
 -----------------------------------------------------------------------------
 This source file is part of SecurityKitAOS.
 
 Copyright 2017-2018 Jon Griffeth
 
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
@testable import SecurityKitAOS


/**
 HMACMD5 Tests
 
 - See Also:
    RFC 2202
 */
class HMACMD5Tests: XCTestCase {
    
    let data   = Data(hexString: "4869205468657265")! // "Hi There"
    let key    = Data(hexString: "0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b")!
    let value  = Data(hexString: "9294727a3638bb1c13f48ef8158bfc9d")!
    
    /**
     - Remark:
     Only confirms that the correct algorithm is being used.
     */
    func testCorrectAlgorithm()
    {
        let hmac      = HMACMD5()
        var signature : Data

        signature = hmac.sign(data: data, using: key)
        
        XCTAssert(signature == value)
    }
    
}


// End of File
