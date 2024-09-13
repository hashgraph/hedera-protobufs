## Table of Contents

- [state/token/account_pending_airdrop.proto](#state_token_account_pending_airdrop-proto)
    - [AccountPendingAirdrop](#proto-AccountPendingAirdrop)
  



<a name="state_token_account_pending_airdrop-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## state/token/account_pending_airdrop.proto
# Account Pending Airdrop.
A single pending airdrop awaiting claim by the recipient.

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in
[RFC2119](https://www.ietf.org/rfc/rfc2119) and clarified in
[RFC8174](https://www.ietf.org/rfc/rfc8174).


<a name="proto-AccountPendingAirdrop"></a>

### AccountPendingAirdrop
A node within a doubly linked list of pending airdrop references.<br/>
This internal state message forms the entries in a doubly-linked list
of references to pending airdrop entries that are "owed" by a particular
account as "sender".

Each entry in this list MUST refer to an existing pending airdrop.<br/>
The pending airdrop MUST NOT be claimed.<br/>
The pending airdrop MUST NOT be canceled.<br/>
The pending airdrop `sender` account's `head_pending_airdrop_id` field
MUST match the `pending_airdrop_id` field in this message.


| Field | Type | Description |
| ----- | ---- | ----------- |
| pending_airdrop_value | [PendingAirdropValue](#proto-PendingAirdropValue) | An amount of fungible tokens to be sent for this pending airdrop. <p> This field SHALL NOT be set for non-fungible/unique tokens. |
| previous_airdrop | [PendingAirdropId](#proto-PendingAirdropId) | A pending airdrop identifier. <p> This field SHALL identify the specific pending airdrop that precedes this position within the doubly linked list of pending airdrops "owed" by the sending account associated with this account airdrop "list".<br/> This SHALL match `pending_airdrop_id` if this is the only entry in the "list". |
| next_airdrop | [PendingAirdropId](#proto-PendingAirdropId) | A pending airdrop identifier.<br/> <p> This field SHALL identify the specific pending airdrop that follows this position within the doubly linked list of pending airdrops "owed" by the sending account associated with this account airdrop "list".<br/> This SHALL match `pending_airdrop_id` if this is the only entry in the "list". |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->



