# Payment workflow migration notes

Reviewed source Edge Functions in Supabase project `strfwaqvxvkhjbqrwmla`. This is a code-path audit only; no payment provider calls, secrets, or live transactions were changed.

## OneKitty
- `initiate-onekitty-checkout` authenticates a user bearer token, creates a pending row in `payments`, and requests checkout from OneKitty.
- `payment-callback` does not trust the callback's success flag alone. It looks up the local pending payment and calls the OneKitty developer transactions endpoint; it requires a matching successful provider transaction before marking the payment completed.
- `check-payment` also has a server-side OneKitty transaction verification path for pending payments.
- `onekitty-callback` is explicitly a test-payment recorder. Its source comments state the callback is recorded as reported and do not establish provider verification. Do not use it to grant live access.

## Paystack
- `initiate-paystack` authenticates the user and creates a pending payment before initiating checkout/charge.
- `paystack-webhook` verifies the webhook signature (including HMAC-SHA512 handling), fetches the transaction from Paystack's verification endpoint, compares it to the local payment and updates only pending payments. Duplicate completed events are treated idempotently.
- `check-payment` also queries Paystack's verification endpoint for pending Paystack transactions.

## Cloudflare Worker port requirements
1. Use a server-side secret binding for provider credentials; never expose provider secrets to the browser.
2. Verify the authenticated user and ownership of the local payment reference.
3. Enforce amount, currency, provider, transaction reference, and expected user matching.
4. Verify provider-side transaction state before any transition to `completed`.
5. Make callback handling idempotent and use conditional updates from `pending` only.
6. Only create/update `access_grants` or `student_access` after verified payment, and preserve audit history.
7. Add replay protection, signature validation where supported, rate limiting, and structured non-sensitive logs.
8. Keep the current Supabase payment functions and callbacks untouched until the Cloudflare implementation passes provider sandbox tests.

**Current state:** payment code has been reviewed for migration requirements only. No payment endpoints have been ported or deployed.