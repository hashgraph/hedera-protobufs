## Table of Contents

- [contract_call.proto](#contract_call-proto)
    - [ContractCallTransactionBody](#proto-ContractCallTransactionBody)
  



<a name="contract_call-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## contract_call.proto
# Contract Call
Transaction body for calls to a Smart Contract.

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in
[RFC2119](https://www.ietf.org/rfc/rfc2119) and clarified in
[RFC8174](https://www.ietf.org/rfc/rfc8174).


<a name="proto-ContractCallTransactionBody"></a>

### ContractCallTransactionBody
Call a function of a given smart contract, providing function parameter
inputs as needed.

Resource ("gas") charges SHALL include all relevant fees incurred by the
contract execution, including any storage required.<br/>
The total transaction fee SHALL incorporate all of the "gas" actually
consumed as well as the standard fees for transaction handling, data
transfers, signature verification, etc...


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| contractID | [ContractID](#proto-ContractID) |  | The ID of a smart contract to call. |
| gas | [int64](#int64) |  | A maximum limit to the amount of gas to use for this call. <p> The network SHALL charge the greater of the following, but SHALL NOT charge more than the value of this field. <ol> <li>The actual gas consumed by the smart contract call.</li> <li>`80%` of this value.</li> </ol> The `80%` factor encourages reasonable estimation, while allowing for some overage to ensure successful execution. |
| amount | [int64](#int64) |  | An amount of tinybar sent via this contract call. <p> If this is non-zero, the function MUST be `payable`. |
| functionParameters | [bytes](#bytes) |  | The smart contract function to call, and the parameters to pass to that function. <p> These MUST be presented in EVM bytecode function call format. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


