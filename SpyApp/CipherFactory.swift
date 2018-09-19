import Foundation

struct CipherFactory {

    private var ciphers: [String: Cipher] = [
        "Ceasar": CeaserCipher(),
        "Alphanumeric": AlphanumericCesarCipher()
    ]

    func cipher(for key: String) -> Cipher {
        return ciphers[key]!
    }
}
