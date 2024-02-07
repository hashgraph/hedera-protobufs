## Table of Contents

- [token_cancel_airdrop.proto](#token_cancel_airdrop-proto)
    - [TokenCancelAirdropTransactionBody](#proto-TokenCancelAirdropTransactionBody)
  



<a name="token_cancel_airdrop-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## token_cancel_airdrop.proto
# Token Cancel Airdrop
Messages used to implement a transaction to cancel a pending airdrop.

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in
[RFC2119](https://www.ietf.org/rfc/rfc2119) and clarified in
[RFC8174](https://www.ietf.org/rfc/rfc8174).


<a name="proto-TokenCancelAirdropTransactionBody"></a>

### TokenCancelAirdropTransactionBody
Token cancel airdrop<br/>
Remove one or more pending airdrops from state on behalf of the
sender(s) for each airdrop.

Each pending airdrop canceled SHALL be removed from state and
SHALL NOT be available to claim.<br/>
Each cancellation SHALL be represented in the transaction body and
SHALL NOT be restated in the record file.<br/>
All cancellations MUST succeed for this transaction to succeed.

### Block Stream Effects
None


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| pending_airdrops | [PendingAirdropId](#proto-PendingAirdropId) | repeated | A list of one or more pending airdrop identifiers.<br/> This list declares the set of pending airdrop entries that the client wishes to cancel; on success all listed pending airdrop entries will be removed. <p> This transaction MUST be signed by the account identified by a `sender_id` for each entry in this list.<br/> This list MUST NOT have any duplicate entries.<br/> This list MUST contain between 1 and 10 entries, inclusive. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->



