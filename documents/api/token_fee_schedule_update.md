## Table of Contents

- [token_fee_schedule_update.proto](#token_fee_schedule_update-proto)
    - [TokenFeeScheduleUpdateTransactionBody](#proto-TokenFeeScheduleUpdateTransactionBody)
  



<a name="token_fee_schedule_update-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## token_fee_schedule_update.proto
#

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="proto-TokenFeeScheduleUpdateTransactionBody"></a>

### TokenFeeScheduleUpdateTransactionBody
At consensus, updates a token type's fee schedule to the given list of custom fees.

If the target token type has no fee_schedule_key, resolves to TOKEN_HAS_NO_FEE_SCHEDULE_KEY.
Otherwise this transaction must be signed to the fee_schedule_key, or the transaction will
resolve to INVALID_SIGNATURE.

If the custom_fees list is empty, clears the fee schedule or resolves to
CUSTOM_SCHEDULE_ALREADY_HAS_NO_FEES if the fee schedule was already empty.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| token_id | [TokenID](#proto-TokenID) |  | The token whose fee schedule is to be updated |
| custom_fees | [CustomFee](#proto-CustomFee) | repeated | The new custom fees to be assessed during a CryptoTransfer that transfers units of this token |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


