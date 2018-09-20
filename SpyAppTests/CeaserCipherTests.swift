import XCTest
@testable import SpyApp

class CeaserCipherTests: XCTestCase {

    var cipher: Cipher!

    override func setUp() {
        super.setUp()
        cipher = CeaserCipher()
    }

    func test_oneCharacterStirngGetsMappedToSelfWith_0_secret() {
        let plaintext = "a"

        let result = cipher.encode(plaintext, secret: "0")

        XCTAssertEqual(plaintext, result)
    }

    func test_nonNumericInputForSecret() {
        let result = cipher.encode("b", secret: "nonNumericString")

        XCTAssertNil(result)
    }
    
    func test_DecodeAndEndcodeWithSpace(){
        let plaintext = "sports"
        
        let encodeText = cipher.encode(plaintext, secret: "2")
        let result = cipher.decode(encodeText!, secret: "2")
        XCTAssertEqual(plaintext, result)
    }


}
