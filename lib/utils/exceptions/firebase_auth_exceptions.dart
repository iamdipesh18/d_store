/// Custom exception class to handle Firebase Authentication specific errors.
class TFirebaseAuthExceptions implements Exception {
  final String code;

  TFirebaseAuthExceptions(this.code);

  /// Map FirebaseAuth error codes to user-friendly messages
  String message(String code) {
    switch (code) {
      case "email-already-in-use":
        return "This email address is already registered. Please use a different email.";

      case "invalid-email":
        return "The email address provided is invalid. Please enter a valid email.";

      case "operation-not-allowed":
        return "Email/Password accounts are not enabled. Please contact support.";

      case "weak-password":
        return "Your password is too weak. Please choose a stronger password.";

      case "user-disabled":
        return "This user account has been disabled. Please contact support.";

      case "user-not-found":
        return "No user found for this email. Please check and try again.";

      case "wrong-password":
        return "Incorrect password. Please try again.";

      case "invalid-verification-code":
        return "The verification code is invalid. Please request a new code.";

      case "invalid-verification-id":
        return "The verification ID is invalid. Please retry verification.";

      case "quota-exceeded":
        return "The quota for this project has been exceeded. Please try again later.";

      case "provider-already-linked":
        return "This account is already linked with another provider.";

      case "requires-recent-login":
        return "For security reasons, please re-login to perform this action.";

      case "credential-already-in-use":
        return "This credential is already associated with another account.";

      case "invalid-credential":
        return "The provided credential is invalid or expired. Please try again.";

      case "account-exists-with-different-credential":
        return "An account already exists with the same email address but different sign-in credentials.";

      case "network-request-failed":
        return "A network error occurred. Please check your internet connection.";

      case "too-many-requests":
        return "Too many requests have been made. Please wait and try again.";

      case "internal-error":
        return "An internal error occurred. Please try again later.";

      case "missing-action-code":
        return "The action code is missing. Please request a new one.";

      case "expired-action-code":
        return "This action code has expired. Please request a new one.";

      case "invalid-action-code":
        return "The action code provided is invalid. Please try again.";

      case "user-token-expired":
        return "Your session has expired. Please log in again.";

      case "invalid-user-token":
        return "Your authentication token is invalid. Please log in again.";

      case "app-not-authorized":
        return "This app is not authorized to use Firebase Authentication.";

      case "app-deleted":
        return "This Firebase project has been deleted. Please contact support.";

      case "invalid-api-key":
        return "Your API key is invalid. Please check your Firebase project configuration.";

      case "invalid-user-id-token":
        return "The user's ID token is invalid. Please log in again.";

      case "user-mismatch":
        return "The provided credential does not match the logged-in user.";

      case "session-expired":
        return "Your session has expired. Please log in again.";

      case "captcha-check-failed":
        return "Captcha check failed. Please try again.";

      case "missing-email":
        return "An email address is required. Please enter your email.";

      case "missing-password":
        return "A password is required. Please enter your password.";

      case "missing-phone-number":
        return "A phone number is required. Please enter your phone number.";

      case "invalid-phone-number":
        return "The provided phone number is invalid. Please enter a valid number.";

      case "unverified-email":
        return "This email has not been verified yet. Please check your inbox.";

      case "expired-id-token":
        return "Your login session has expired. Please sign in again.";

      case "tenant-id-mismatch":
        return "The tenant ID provided does not match the authenticated tenant.";

      case "invalid-tenant-id":
        return "The tenant ID provided is invalid.";

      case "multi-factor-auth-required":
        return "Multi-factor authentication is required. Please complete additional verification steps.";

      case "second-factor-already-in-use":
        return "This second factor is already enrolled on your account.";

      case "maximum-second-factor-count-exceeded":
        return "You have reached the maximum number of second factors allowed.";

      case "unsupported-first-factor":
        return "The provided first factor is not supported for MFA.";

      case "missing-client-identifier":
        return "The request is missing a client identifier. Please try again.";

      case "web-storage-unsupported":
        return "Web storage is not supported or disabled in this environment.";

      case "popup-blocked":
        return "The authentication popup was blocked by the browser.";

      case "popup-closed-by-user":
        return "The authentication popup was closed before completing sign in.";

      case "unauthorized-domain":
        return "The domain of this application is not authorized for OAuth operations.";

      case "invalid-oauth-client-id":
        return "The OAuth client ID is invalid. Please check your configuration.";

      case "invalid-oauth-provider":
        return "The specified OAuth provider is invalid or not supported.";

      case "invalid-recipient-email":
        return "The recipient email provided is invalid.";

      case "missing-continue-uri":
        return "A continue URL is required for this request.";

      case "invalid-continue-uri":
        return "The continue URL provided is invalid.";

      case "unauthorized-continue-uri":
        return "The continue URL provided is not authorized.";

      case "dynamic-link-not-activated":
        return "Dynamic links have not been activated for this Firebase project.";

      case "invalid-message-payload":
        return "The email message payload is invalid.";

      case "invalid-sender":
        return "The email sender is invalid. Please check Firebase console settings.";

      case "invalid-recipient":
        return "The email recipient is invalid.";

      case "invalid-verification-proof":
        return "The verification proof is invalid. Please request a new verification code.";

      case "session-cookie-expired":
        return "Your session cookie has expired. Please sign in again.";

      case "invalid-session-cookie":
        return "The session cookie is invalid. Please sign in again.";

      case "missing-app-credential":
        return "The phone verification credential is missing. Please retry verification.";

      case "invalid-app-credential":
        return "The app credential is invalid. Please restart the verification process.";

      case "app-not-installed":
        return "The app is required to complete authentication but is not installed on this device.";

      case "captcha-not-ready":
        return "Captcha verification is not ready yet. Please try again later.";

      case "invalid-recaptcha-token":
        return "The reCAPTCHA token is invalid. Please try again.";

      case "invalid-verification-session":
        return "The verification session is invalid. Please retry verification.";

      case "missing-verification-code":
        return "The verification code is missing. Please enter the code you received.";

      case "missing-verification-id":
        return "The verification ID is missing. Please restart the verification process.";

      case "missing-phone-auth-token":
        return "A phone authentication token is missing. Please retry authentication.";

      case "invalid-phone-auth-token":
        return "The phone authentication token is invalid. Please retry authentication.";

      case "recaptcha-cancelled":
        return "The reCAPTCHA flow was cancelled. Please try again.";

      case "web-context-cancelled":
        return "The authentication operation was cancelled in the web context.";

      case "invalid-persistence-type":
        return "The specified persistence type is invalid for this environment.";

      case "unsupported-persistence-type":
        return "Persistence is not supported in this environment.";

      case "invalid-dynamic-link-domain":
        return "The provided dynamic link domain is invalid or not configured.";

      case "missing-iframe-start":
        return "The authentication iframe failed to start. Please try again.";

      case "missing-iframe-end":
        return "The authentication iframe failed to finish loading. Please try again.";

      case "missing-client-type":
        return "The request is missing a client type identifier.";

      case "web-internal-error":
        return "A web-specific internal error occurred. Please try again.";

      case "expired-popup-request":
        return "The popup request has expired. Please try again.";

      default:
        return "An unexpected authentication error occurred. Please try again.";
    }
  }
}
