## Table of Contents

- [node_stake_update.proto](#node_stake_update-proto)
    - [NodeStake](#proto-NodeStake)
    - [NodeStakeUpdateTransactionBody](#proto-NodeStakeUpdateTransactionBody)
  



<a name="node_stake_update-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## node_stake_update.proto
#

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="proto-NodeStake"></a>

### NodeStake
Staking info for each node at the end of a staking period.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| max_stake | [int64](#int64) |  | The maximum stake (rewarded or not rewarded) this node can have as consensus weight. If its stake to reward is above this maximum at the start of a period, then accounts staking to the node in that period will be rewarded at a lower rate scaled by (maxStake / stakeRewardStart). |
| min_stake | [int64](#int64) |  | The minimum stake (rewarded or not rewarded) this node must reach before having non-zero consensus weight. If its total stake is below this minimum at the start of a period, then accounts staking to the node in that period will receive no rewards. |
| node_id | [int64](#int64) |  | The id of this node. |
| reward_rate | [int64](#int64) |  | The reward rate _per whole hbar_ that was staked to this node with declineReward=false from the start of the staking period that is ending. |
| stake | [int64](#int64) |  | Consensus weight of this node for the new staking period. |
| stake_not_rewarded | [int64](#int64) |  | Total of (balance + stakedToMe) for all accounts staked to this node with declineReward=true, at the beginning of the new staking period. |
| stake_rewarded | [int64](#int64) |  | Total of (balance + stakedToMe) for all accounts staked to this node with declineReward=false, at the beginning of the new staking period. |






<a name="proto-NodeStakeUpdateTransactionBody"></a>

### NodeStakeUpdateTransactionBody
Updates the staking info at the end of staking period to indicate new staking period has started.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| end_of_staking_period | [Timestamp](#proto-Timestamp) |  | Time and date of the end of the staking period that is ending |
| node_stake | [NodeStake](#proto-NodeStake) | repeated | Staking info of each node at the beginning of the new staking period |
| max_staking_reward_rate_per_hbar | [int64](#int64) |  | The maximum reward rate, in tinybars per whole hbar, that any account could receive in this staking period. |
| node_reward_fee_fraction | [Fraction](#proto-Fraction) |  | The fraction of the network and service fees paid to the node reward account 0.0.801. |
| staking_periods_stored | [int64](#int64) |  | The maximum number of trailing periods for which a user can collect rewards. For example, if this is 365 with a UTC calendar day period, then users must collect rewards at least once per calendar year to avoid missing any value. |
| staking_period | [int64](#int64) |  | The number of minutes in a staking period. Note for the special case of 1440 minutes, periods are treated as UTC calendar days, rather than repeating 1440 minute periods left-aligned at the epoch. |
| staking_reward_fee_fraction | [Fraction](#proto-Fraction) |  | The fraction of the network and service fees paid to the staking reward account 0.0.800. |
| staking_start_threshold | [int64](#int64) |  | The minimum balance of staking reward account 0.0.800 required to active rewards. |
| staking_reward_rate | [int64](#int64) |  | **Deprecated.** (DEPRECATED) The maximum total number of tinybars to be distributed as staking rewards in the ending period. Please consult the max_total_reward field instead. |
| reserved_staking_rewards | [int64](#int64) |  | The amount of the staking reward funds (account 0.0.800) reserved to pay pending rewards that have been earned but not collected. |
| unreserved_staking_reward_balance | [int64](#int64) |  | The unreserved balance of account 0.0.800 at the close of the just-ending period; this value is used to compute the HIP-782 balance ratio. |
| reward_balance_threshold | [int64](#int64) |  | The unreserved tinybar balance of account 0.0.800 required to achieve the maximum per-hbar reward rate in any period; please see HIP-782 for details. |
| max_stake_rewarded | [int64](#int64) |  | The maximum amount of tinybar that can be staked for reward while still achieving the maximum per-hbar reward rate in any period; please see HIP-782 for details. |
| max_total_reward | [int64](#int64) |  | The maximum total tinybars that could be paid as staking rewards in the ending period, after applying the settings for the 0.0.800 balance threshold and the maximum stake rewarded. This field replaces the deprecated field staking_reward_rate. It is only for convenience, since a mirror node could also calculate its value by iterating the node_stake list and summing stake_rewarded fields; then multiplying this sum by the max_staking_reward_rate_per_hbar. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


