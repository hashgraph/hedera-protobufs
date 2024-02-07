## Table of Contents

- [token_delete.proto](#token_delete-proto)
    - [TokenDeleteTransactionBody](#proto-TokenDeleteTransactionBody)
  



<a name="token_delete-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## token_delete.proto
# Token Delete
Delete an Hedera Token Service (HTS) token.

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in
[RFC2119](https://www.ietf.org/rfc/rfc2119) and clarified in
[RFC8174](https://www.ietf.org/rfc/rfc8174).


<a name="proto-TokenDeleteTransactionBody"></a>

### TokenDeleteTransactionBody
Mark a token as deleted.<br/>
A deleted token remains present in the network state, but is no longer
active, cannot be held in a balance, and all operations on that token
fail. A deleted token is removed from network state when it expires.

#### Operations on a deleted token
All operations on a deleted token SHALL fail with a
status code `TOKEN_WAS_DELETED`.<br/>
Any attempt to transfer a deleted token between accounts SHALL fail with
a status code `TOKEN_WAS_DELETED`.

> QUESTIONS
>> What happens to existing balances/NFTs?
>> Are these removed; are they stuck on the accounts?
>
>> If balances/NFTs remain, can a `tokenReject` remove them?

#### Requirements
The `admin_key` for the token MUST be set, and MUST
sign this transaction.<br/>
If the `admin_key` for the token is not set, this transaction SHALL
fail with a status code `TOKEN_IS_IMMUTABlE`.

### Block Stream Effects
None


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| token | [TokenID](#proto-TokenID) |  | A token identifier. <p> This SHALL identify the token type to delete.<br/> The identified token MUST exist, and MUST NOT be deleted. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->



