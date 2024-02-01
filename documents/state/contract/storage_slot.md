## Table of Contents

- [state/contract/storage_slot.proto](#state_contract_storage_slot-proto)
    - [SlotKey](#proto-SlotKey)
    - [SlotValue](#proto-SlotValue)
  



<a name="state_contract_storage_slot-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## state/contract/storage_slot.proto
# EVM Contract Slot
Information regarding EVM storage "slot"s for the Hedera Smart Contract service.

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="proto-SlotKey"></a>

### SlotKey
The key of a storage slot. A slot is scoped to a specific contract ID.

For each contract, its EVM storage is a mapping of 256-bit keys (or "words") to 256-bit values.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| contractID | [ContractID](#proto-ContractID) |  | The Contract ID of the contract that owns (and pays for) this slot. |
| key | [bytes](#bytes) |  | The EVM key of this slot, left-padded with zeros to form a 256-bit word. |






<a name="proto-SlotValue"></a>

### SlotValue
The value of a contract storage slot. For the EVM, this is a single "word".

Because we iterate through all the storage slots for an expired contract
when purging it from state, our slot values also include the words
of the previous and next keys in this contract's storage "virtual linked list".


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| value | [bytes](#bytes) |  | The EVM value in this slot, left-padded with zeros to form a 256-bit word. |
| previous_key | [bytes](#bytes) |  | The word of the previous key in this contract's storage list (if any). |
| next_key | [bytes](#bytes) |  | The word of the next key in this contract's storage list (if any). |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


