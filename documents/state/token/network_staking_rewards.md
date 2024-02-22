## Table of Contents

- [state/token/network_staking_rewards.proto](#state_token_network_staking_rewards-proto)
    - [NetworkStakingRewards](#proto-NetworkStakingRewards)
  



<a name="state_token_network_staking_rewards-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## state/token/network_staking_rewards.proto
# Network Staking Rewards
The information needed to calculate the staking rewards for all nodes in the network.

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="proto-NetworkStakingRewards"></a>

### NetworkStakingRewards
An Hedera Token Service staking reward entity.
This stores values related to the aggregate staking rewards for all nodes in the network. It is
calculated at the beginning of each staking period for all nodes.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| staking_rewards_activated | [bool](#bool) |  | A flag indicating that staking rewards are activated on the network. Among other criteria, this is set to true when the balance of 0.0.800 (the account that pays rewards) reaches a minimum required balance. |
| total_staked_reward_start | [int64](#int64) |  | A global snapshot of the `stake_to_reward` value for all nodes at the beginning of the current staking period.<br/> The `stake_to_reward` value is the sum of balance and `staked_to_me` for all accounts staked to a node that do not decline staking rewards.<br/> This is needed for calculating rewards for current staking period without considering changes to `stake_to_reward` within the current staking period.<br/> This value SHALL be reset at the beginning of every staking period. |
| total_staked_start | [int64](#int64) |  | A global snapshot of the `stake` value for all nodes at the beginning of the current staking period.<br/> The `stake` value is the sum of balance and `staked_to_me` for all accounts staked to a node, and SHALL NOT consider whether the account has accepted or declined rewards. This value SHALL be reset at the beginning of every staking period. |
| pending_rewards | [int64](#int64) |  | The total staking rewards, in tinybars, that MAY be collected by all accounts staking to all nodes after the end of this staking period.<br/> This SHALL be calculated assuming that no account "renounces" its rewards by setting `decline_reward` to true, or is ineligible for some other reason.<br/> If a node is deleted, the `pending_rewards` value of that node SHALL be subtracted from this value. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


