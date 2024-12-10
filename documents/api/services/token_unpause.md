## Table of Contents

- [token_unpause.proto](#token_unpause-proto)
    - [TokenUnpauseTransactionBody](#proto-TokenUnpauseTransactionBody)
  



<a name="token_unpause-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## token_unpause.proto
# Token Un-Pause
A transaction to "unpause" (i.e. resume) all activity for a token. While
a token is "paused" it cannot be transferred between accounts by any
transaction other than `rejectToken`. Once "unpaused", transactions involving
that token may resume.

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in
[RFC2119](https://www.ietf.org/rfc/rfc2119) and clarified in
[RFC8174](https://www.ietf.org/rfc/rfc8174).


<a name="proto-TokenUnpauseTransactionBody"></a>

### TokenUnpauseTransactionBody
Resume transaction activity for a token.

This transaction MUST be signed by the Token `pause_key`.<br/>
The `token` identified MUST exist, and MUST NOT be deleted.<br/>
The `token` identified MAY not be paused; if the token is not paused,
this transaction SHALL have no effect.
The `token` identified MUST have a `pause_key` set, the `pause_key` MUST be
a valid `Key`, and the `pause_key` MUST NOT be an empty `KeyList`.<br/>
An `unpaused` token MAY be transferred or otherwise modified.

### Block Stream Effects
None


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| token | [TokenID](#proto-TokenID) |  | A token identifier. <p> The identified token SHALL be "unpaused". Subsequent transactions involving that token MAY succeed. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->



