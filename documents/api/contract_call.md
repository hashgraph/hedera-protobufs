## Table of Contents

- [contract_call.proto](#contract_call-proto)
    - [ContractCallTransactionBody](#proto-ContractCallTransactionBody)
  



<a name="contract_call-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## contract_call.proto
#

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="proto-ContractCallTransactionBody"></a>

### ContractCallTransactionBody
Call a function of the given smart contract instance, giving it functionParameters as its inputs.
The call can use at maximum the given amount of gas - the paying account will not be charged for
any unspent gas.

If this function results in data being stored, an amount of gas is calculated that reflects this
storage burden.

The amount of gas used, as well as other attributes of the transaction, e.g. size, number of
signatures to be verified, determine the fee for the transaction - which is charged to the paying
account.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| contractID | [ContractID](#proto-ContractID) |  | The contract to call |
| gas | [int64](#int64) |  | the maximum amount of gas to use for the call |
| amount | [int64](#int64) |  | number of tinybars sent (the function must be payable if this is nonzero) |
| functionParameters | [bytes](#bytes) |  | which function to call, and the parameters to pass to the function |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


