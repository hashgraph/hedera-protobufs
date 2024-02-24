## Table of Contents

- [token_revoke_kyc.proto](#token_revoke_kyc-proto)
    - [TokenRevokeKycTransactionBody](#proto-TokenRevokeKycTransactionBody)
  



<a name="token_revoke_kyc-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## token_revoke_kyc.proto
#

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="proto-TokenRevokeKycTransactionBody"></a>

### TokenRevokeKycTransactionBody
Revokes KYC to the account for the given token. Must be signed by the Token's kycKey.
If the provided account is not found, the transaction will resolve to INVALID_ACCOUNT_ID.
If the provided account has been deleted, the transaction will resolve to ACCOUNT_DELETED.
If the provided token is not found, the transaction will resolve to INVALID_TOKEN_ID.
If the provided token has been deleted, the transaction will resolve to TOKEN_WAS_DELETED.
If an Association between the provided token and account is not found, the transaction will
resolve to TOKEN_NOT_ASSOCIATED_TO_ACCOUNT.
If no KYC Key is defined, the transaction will resolve to TOKEN_HAS_NO_KYC_KEY.
Once executed the Account is marked as KYC Revoked


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| token | [TokenID](#proto-TokenID) |  | The token for which this account will get his KYC revoked. If token does not exist, transaction results in INVALID_TOKEN_ID |
| account | [AccountID](#proto-AccountID) |  | The account to be KYC Revoked |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


