## Table of Contents

- [state/common.proto](#state_common-proto)
    - [EntityIDPair](#proto-EntityIDPair)
    - [EntityNumber](#proto-EntityNumber)
  



<a name="state_common-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## state/common.proto
# State Common
Two older messages used in rare cases.
- EntityNumber is used to store The last used entity number in state, so
  that all entities in state have unique entity numbers, even across types.
- EntityIDPair is used to store a Token/Account pair in certain rare cases.

Where possible, these messages SHOULD NOT be used.  A primitive `int64` or
`google.protobuf.Int64Value` wrapper is preferred instead of `EntityNumber
and `TokenAssociation` is preferred instead of `EntityIDPair`.

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119)
and clarified in [RFC8174](https://www.ietf.org/rfc/rfc8174).


<a name="proto-EntityIDPair"></a>

### EntityIDPair
A Pair of AccountID and TokenID.<br/>
This is used as a key in certain cases.

The TokenAssociation message should be used instead of this, when possible.


| Field | Type | Description |
| ----- | ---- | ----------- |
| account_id | [AccountID](#proto-AccountID) | An account identifier for the associated account. |
| token_id | [TokenID](#proto-TokenID) | A token identifier for the associated token. |






<a name="proto-EntityNumber"></a>

### EntityNumber
A single 64-bit number identifying a Hedera native entity.


| Field | Type | Description |
| ----- | ---- | ----------- |
| number | [int64](#int64) | The entity number to store. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->



