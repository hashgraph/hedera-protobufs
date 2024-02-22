## Table of Contents

- [token_unpause.proto](#token_unpause-proto)
    - [TokenUnpauseTransactionBody](#proto-TokenUnpauseTransactionBody)
  



<a name="token_unpause-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## token_unpause.proto
#

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="proto-TokenUnpauseTransactionBody"></a>

### TokenUnpauseTransactionBody
Unpauses the Token. Must be signed with the Token's pause key.
If the provided token is not found, the transaction will resolve to INVALID_TOKEN_ID.
If the provided token has been deleted, the transaction will resolve to TOKEN_WAS_DELETED.
If no Pause Key is defined, the transaction will resolve to TOKEN_HAS_NO_PAUSE_KEY.
Once executed the Token is marked as Unpaused and can be used in Transactions.
The operation is idempotent - becomes a no-op if the Token is already unpaused.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| token | [TokenID](#proto-TokenID) |  | The token to be unpaused. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


