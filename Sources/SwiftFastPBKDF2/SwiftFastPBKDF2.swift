import CPBKDF2

enum FastPBKDF2 {
    static let SHA1_OUT_SIZE: Int = 20
    static let SHA256_OUT_SIZE: Int = 32
    static let SHA512_OUT_SIZE: Int = 64

    static func hmacSHA1(input: [UInt8], salt: [UInt8], iterations: UInt32, dklen: Int = SHA1_OUT_SIZE) -> [UInt8] {
        var out = [UInt8](repeating: 0, count: dklen)

        fastpbkdf2_hmac_sha1(
            input,
            input.count,
            salt,
            salt.count,
            iterations,
            &out,
            dklen
        )

        return out
    }

    static func hmacSHA256(input: [UInt8], salt: [UInt8], iterations: UInt32, dklen: Int = SHA256_OUT_SIZE) -> [UInt8] {
        var out = [UInt8](repeating: 0, count: dklen)

        fastpbkdf2_hmac_sha256(
            input,
            input.count,
            salt,
            salt.count,
            iterations,
            &out,
            dklen
        )

        return out
    }

    static func hmacSHA512(input: [UInt8], salt: [UInt8], iterations: UInt32, dklen: Int = SHA512_OUT_SIZE) -> [UInt8] {
        var out = [UInt8](repeating: 0, count: dklen)

        fastpbkdf2_hmac_sha512(
            input,
            input.count,
            salt,
            salt.count,
            iterations,
            &out,
            dklen
        )

        return out
    }
}
