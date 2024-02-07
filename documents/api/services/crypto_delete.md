## Table of Contents

- [crypto_delete.proto](#crypto_delete-proto)
    - [CryptoDeleteTransactionBody](#proto-CryptoDeleteTransactionBody)
  



<a name="crypto_delete-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## crypto_delete.proto
# Crypto Delete
Message to delete an account.

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in
[RFC2119](https://www.ietf.org/rfc/rfc2119) and clarified in
[RFC8174](https://www.ietf.org/rfc/rfc8174).


<a name="proto-CryptoDeleteTransactionBody"></a>

### CryptoDeleteTransactionBody
Delete an account.<br/>
This will mark an account deleted, and transfer all tokens to a "sweep"
account.

A deleted account SHALL NOT hold a balance in any token type.<br/>
A deleted account SHALL remain in state until it expires.<br/>
Transfers that would increase the balance of a deleted account
SHALL fail.<br/>
A deleted account MAY be subject of a `cryptoUpdate` transaction to extend
its expiration.<br/>
When a deleted account expires it SHALL be removed entirely, and SHALL NOT
be archived.

### Record Stream Effects
???


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| transferAccountID | [AccountID](#proto-AccountID) |  | An account identifier. <p> The identified account SHALL receive all tokens from the deleted account.<br/> The identified account MUST sign this transaction.<br/> If not set, the account to be deleted MUST NOT have a balance in any token, a balance in HBAR, or hold any NFT. |
| deleteAccountID | [AccountID](#proto-AccountID) |  | An account identifier. <p> This account SHALL be deleted if this transaction succeeds.<br/> This account SHOULD not hold any balance other than HBAR.<br/> This account MUST sign this transaction.<br/> This field MUST be set to a valid account identifier. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


