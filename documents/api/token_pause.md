## Table of Contents

- [token_pause.proto](#token_pause-proto)
    - [TokenPauseTransactionBody](#proto-TokenPauseTransactionBody)
  



<a name="token_pause-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## token_pause.proto
#

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="proto-TokenPauseTransactionBody"></a>

### TokenPauseTransactionBody
Pauses the Token from being involved in any kind of Transaction until it is unpaused.
Must be signed with the Token's pause key.
If the provided token is not found, the transaction will resolve to INVALID_TOKEN_ID.
If the provided token has been deleted, the transaction will resolve to TOKEN_WAS_DELETED.
If no Pause Key is defined, the transaction will resolve to TOKEN_HAS_NO_PAUSE_KEY.
Once executed the Token is marked as paused and will be not able to be a part of any transaction.
The operation is idempotent - becomes a no-op if the Token is already Paused.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| token | [TokenID](#proto-TokenID) |  | The token to be paused. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


