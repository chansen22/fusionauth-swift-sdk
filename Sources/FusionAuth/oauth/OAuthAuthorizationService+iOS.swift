#if os(iOS) || targetEnvironment(macCatalyst)
import UIKit
import AppAuth

extension OAuthAuthorizationService {
    internal func getPresenting() -> UIViewController {
        return UIApplication.topViewController!
    }

    internal func getUserAgent(prefersEphemeralSession: Bool = false) throws -> OIDExternalUserAgent {
        guard let userAgent = OIDExternalUserAgentIOS(presenting: getPresenting(), prefersEphemeralWebBrowserSession: prefersEphemeralSession) else {
            throw OAuthError.invalidUserAgent
        }
        return userAgent
    }
}
#endif
