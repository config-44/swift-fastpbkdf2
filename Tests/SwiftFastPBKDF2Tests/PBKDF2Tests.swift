import XCTest
import Foundation
import SwiftExtensionsPack

@testable import SwiftFastPBKDF2

final class SwiftFastPBKDF2Tests: XCTestCase {
    func testPBKDF2_HMAC_SHA1() async throws {
        let expected = Data(hexString: "ea6c014dc72d6f8ccd1ed92ace1d41f0d8de8957")!.bytes

        let input = [UInt8]("password".data(using: .utf8)!)
        let salt = [UInt8]("salt".data(using: .utf8)!)
        let iterations: UInt32 = 2

        let result = FastPBKDF2.hmacSHA1(input: input, salt: salt, iterations: iterations)
        XCTAssertEqual(result.count, 20)
        XCTAssertEqual(result, expected)
    }

    func testPBKDF2_HMAC_SHA256() async throws {
        let expected = Data(hexString: "ae4d0c95af6b46d32d0adff928f06dd02a303f8ef3c251dfd6e2d85a95474c43")!.bytes

        let input = [UInt8]("password".data(using: .utf8)!)
        let salt = [UInt8]("salt".data(using: .utf8)!)
        let iterations: UInt32 = 2

        let result = FastPBKDF2.hmacSHA256(input: input, salt: salt, iterations: iterations)
        XCTAssertEqual(result.count, 32)
        XCTAssertEqual(result, expected)
    }

    func testPBKDF2_HMAC_SHA512() async throws {
        let expected = Data(hexString: "e1d9c16aa681708a45f5c7c4e215ceb66e011a2e9f0040713f18aefdb866d53c")!.bytes

        let input = [UInt8]("password".data(using: .utf8)!)
        let salt = [UInt8]("salt".data(using: .utf8)!)
        let iterations: UInt32 = 2

        let result = FastPBKDF2.hmacSHA512(input: input, salt: salt, iterations: iterations, dklen: 32)
        XCTAssertEqual(result.count, 32)
        XCTAssertEqual(result, expected)
    }
}
