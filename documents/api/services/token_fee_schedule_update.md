## Table of Contents

- [token_fee_schedule_update.proto](#token_fee_schedule_update-proto)
    - [TokenFeeScheduleUpdateTransactionBody](#proto-TokenFeeScheduleUpdateTransactionBody)
  



<a name="token_fee_schedule_update-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## token_fee_schedule_update.proto
# Fee Schedule Update
Transaction to update the fee schedule for a token. A token creator may
wish to charge custom transaction fees for a token type, and if a
`fee_schedule_key` is assigned, this transaction enables adding, removing,
or updating those custom transaction fees.

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in
[RFC2119](https://www.ietf.org/rfc/rfc2119) and clarified in
[RFC8174](https://www.ietf.org/rfc/rfc8174).


<a name="proto-TokenFeeScheduleUpdateTransactionBody"></a>

### TokenFeeScheduleUpdateTransactionBody
Update the custom fee schedule for a token type.

The token MUST have a `fee_schedule_key` set and that key MUST NOT
be an empty `KeyList`.<br/>
The token `fee_schedule_key` MUST sign this transaction.<br/>
The token MUST exist, MUST NOT be deleted, and MUST NOT be expired.<br/>

If the custom_fees list is empty, clears the fee schedule or resolves to
CUSTOM_SCHEDULE_ALREADY_HAS_NO_FEES if the fee schedule was already empty.

### Block Stream Effects
None


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| token_id | [TokenID](#proto-TokenID) |  | A token identifier. <p> This SHALL identify the token type to modify with an updated custom fee schedule.<br/> The identified token MUST exist, and MUST NOT be deleted. |
| custom_fees | [CustomFee](#proto-CustomFee) | repeated | A list of custom fees representing a fee schedule. <p> This list MAY be empty to remove custom fees from a token.<br/> If the identified token is a non-fungible/unique type, the entries in this list MUST NOT declare a `fractional_fee`.<br/> If the identified token is a fungible/common type, the entries in this list MUST NOT declare a `royalty_fee`.<br/> Any token type MAY include entries that declare a `fixed_fee`. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->



