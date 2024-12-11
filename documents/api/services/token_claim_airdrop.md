## Table of Contents

- [token_claim_airdrop.proto](#token_claim_airdrop-proto)
    - [TokenClaimAirdropTransactionBody](#proto-TokenClaimAirdropTransactionBody)
  



<a name="token_claim_airdrop-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## token_claim_airdrop.proto
# Token Claim Airdrop
Messages used to implement a transaction to claim a pending airdrop.

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in
[RFC2119](https://www.ietf.org/rfc/rfc2119) and clarified in
[RFC8174](https://www.ietf.org/rfc/rfc8174).


<a name="proto-TokenClaimAirdropTransactionBody"></a>

### TokenClaimAirdropTransactionBody
Token claim airdrop<br/>
Complete one or more pending transfers on behalf of the
recipient(s) for an airdrop.

The sender MUST have sufficient balance to fulfill the airdrop at the
time of claim. If the sender does not have sufficient balance, the
claim SHALL fail.<br/>
Each pending airdrop successfully claimed SHALL be removed from state and
SHALL NOT be available to claim again.<br/>
Each claim SHALL be represented in the transaction body and
SHALL NOT be restated in the record file.<br/>
All claims MUST succeed for this transaction to succeed.

### Block Stream Effects
The completed transfers SHALL be present in the transfer list.


| Field | Type | Description |
| ----- | ---- | ----------- |
| pending_airdrops | [PendingAirdropId](#proto-PendingAirdropId) | A list of one or more pending airdrop identifiers. <p> This transaction MUST be signed by the account identified by the `receiver_id` for each entry in this list.<br/> This list MUST contain between 1 and 10 entries, inclusive.<br/> This list MUST NOT have any duplicate entries. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->



