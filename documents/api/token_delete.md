## Table of Contents

- [token_delete.proto](#token_delete-proto)
    - [TokenDeleteTransactionBody](#proto-TokenDeleteTransactionBody)
  



<a name="token_delete-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## token_delete.proto
#

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="proto-TokenDeleteTransactionBody"></a>

### TokenDeleteTransactionBody
Marks a token as deleted, though it will remain in the ledger.
The operation must be signed by the specified Admin Key of the Token. If
admin key is not set, Transaction will result in TOKEN_IS_IMMUTABlE.
Once deleted update, mint, burn, wipe, freeze, unfreeze, grant kyc, revoke
kyc and token transfer transactions will resolve to TOKEN_WAS_DELETED.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| token | [TokenID](#proto-TokenID) |  | The token to be deleted. If invalid token is specified, transaction will result in INVALID_TOKEN_ID |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


