## Table of Contents

- [token_grant_kyc.proto](#token_grant_kyc-proto)
    - [TokenGrantKycTransactionBody](#proto-TokenGrantKycTransactionBody)
  



<a name="token_grant_kyc-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## token_grant_kyc.proto
# Token Grant KYC
Grant "KYC" status to an account with respect to a token.

The "KYC' property is named for the "Know Your Customer" requirements in
US federal regulations (FINRA 2090 and related US Code) that was subsequently
incorporated into laws and regulations for many worldwide jurisdictions.
The process requires a regulated financial entity to positively identify
customers and certain other entities.

This transaction enables a token administrator to track whether KYC
requirements are met for a given account transacting in that token.

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in
[RFC2119](https://www.ietf.org/rfc/rfc2119) and clarified in
[RFC8174](https://www.ietf.org/rfc/rfc8174).


<a name="proto-TokenGrantKycTransactionBody"></a>

### TokenGrantKycTransactionBody
Grant "Know Your Customer"(KYC) for one account for a single token.

This transaction MUST be signed by the `kyc_key` for the token.<br/>
The identified token MUST have a `kyc_key` set to a valid `Key` value.<br/>
The token `kyc_key` MUST NOT be an empty `KeyList`.<br/>
The identified token MUST exist and MUST NOT be deleted.<br/>
The identified account MUST exist and MUST NOT be deleted.<br/>
The identified account MUST have an association to the identified token.<br/>
On success the association between the identified account and the identified
token SHALL be marked as "KYC granted".

### Block Stream Effects
None


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| token | [TokenID](#proto-TokenID) |  | A token identifier. <p> The identified token SHALL grant "KYC" for the account identified by the `account` field.<br/> The identified token MUST be associated to the account identified by the `account` field. |
| account | [AccountID](#proto-AccountID) |  | An account identifier. <p> The token identified by the `token` field SHALL grant "KYC" for the identified account.<br/> This account MUST be associated to the token identified by the `token` field. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->



