## Table of Contents

- [state/token/staking_node_info.proto](#state_token_staking_node_info-proto)
    - [StakingNodeInfo](#proto-StakingNodeInfo)
  



<a name="state_token_staking_node_info-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## state/token/staking_node_info.proto
# Staking Node Information
This is an entry describing the staking characteristics of a single active
node.

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119)
and clarified in [RFC8174](https://www.ietf.org/rfc/rfc8174).


<a name="proto-StakingNodeInfo"></a>

### StakingNodeInfo
An Hedera Token Service staking info entity.

Staking info is per node. Shard and Realm are implied based on the network
address book entry for this node.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| node_number | [int64](#int64) |  | The entity number of this node.<br/> The shard and realm numbers are implied, based on the network address book entry for this node. <p> This value SHALL be unique within a given shard and realm.<br/> This value MAY be repeated across shards and/or realms. |
| min_stake | [int64](#int64) |  | The minimum stake, in tinybar, that is required for this node to have a non-zero weight in the network consensus. <p> If the current value of `stake` is below this value, this node SHALL have a zero weight in network consensus. |
| max_stake | [int64](#int64) |  | The maximum stake to this node that is considered to calculate its weight in the network consensus. <p> If the current `stake` value is above this limit, the excess staked HBAR SHALL NOT be considered when determining consensus weight. |
| stake_to_reward | [int64](#int64) |  | The sum of balances of all accounts staked to this node, considering only accounts that choose to receive rewards. |
| stake_to_not_reward | [int64](#int64) |  | The sum of balances of all accounts staked to this node, considering only accounts that decline to receive rewards. |
| stake_reward_start | [int64](#int64) |  | The snapshot of stake_to_reward value at the beginning of the current staking period. <p> This is necessary when calculating rewards for the current staking period without considering changes to `stake_to_reward` _within_ the current staking period.<br/> This value SHALL be reset at the beginning of every staking period. |
| unclaimed_stake_reward_start | [int64](#int64) |  | The amount of staked HBAR from `stake_reward_start` that will have unclaimed rewards due to accounts changing their staking metadata in a way that disqualifies them for the current staking period. <p> This value SHALL be reset at the beginning of every staking period. |
| stake | [int64](#int64) |  | The total amount of HBAR staked to this node. <p> This is sum of stake_to_reward and stake_to_not_reward.<br/> If the sum is greater than `max_stake`, then the _effective_ stake SHALL be `max_stake`.<br/> If the sum is less than `min_stake`, then the _effective_ stake SHALL be `0`. |
| reward_sum_history | [int64](#int64) | repeated | A running list of reward amounts for the last 365+1 staking periods (typically a year and a day). <p> The first element SHALL be the reward up to and including the last full period prior to the present reward period.<br/> The second element SHALL be the reward up to and including the period before the last full period prior to the present period.<br/> The list SHALL continue in reverse chronological order until the reward history limit is reached. |
| weight | [int32](#int32) |  | The consensus weight of this node in the network. <p> This is recomputed based on the `stake` of this node at midnight UTC of each day. If the `stake` of this node at that time is less than `min_stake`, then the weight SHALL be 0.<br/> The sum of all weights of nodes in the network SHALL be less than 500. <p> Given the following: <ul> <li>The `effective stake` of a single node SHALL be `0` if the node `stake` is less than `min_stake`.</li> <li>The `effective stake` SHALL be `max_stake` if the node `stake` is greater than `max_stake`.</li> <li>The `effective stake` SHALL be the actual value of `stake` if `min_stake` < `stake` < `max_stake`.</li> <li>The `effective network stake` SHALL be calculated as ∑(`effective stake` of each node) for all nodes in the network address book.</li> </ul> The actual consensus weight for this node SHALL be calculated as __(500 * (`effective stake`/`effective network stake`))__ |
| pending_rewards | [int64](#int64) |  | The total staking rewards in tinybars that MAY be collected by all accounts staking to the current node after the end of this staking period. <p> This SHALL be calculated assuming that no account "renounces" its rewards by setting `decline_reward` to true, or is ineligible for some other reason.<br/> When the current node is deleted, this amount SHALL be subtracted from the total pending rewards of all accounts staking to all nodes in the network in NetworkStakingRewards. |
| deleted | [bool](#bool) |  | A flag indicating that this node has been removed from this network. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


