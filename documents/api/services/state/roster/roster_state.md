## Table of Contents

- [state/roster/roster_state.proto](#state_roster_roster_state-proto)
    - [RosterState](#com-hedera-hapi-node-state-roster-RosterState)
    - [RoundRosterPair](#com-hedera-hapi-node-state-roster-RoundRosterPair)
  



<a name="state_roster_roster_state-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## state/roster/roster_state.proto



<a name="com-hedera-hapi-node-state-roster-RosterState"></a>

### RosterState
The current state of platform rosters.<br/>
This message stores a roster data for the platform in network state.

The roster state SHALL encapsulate the incoming candidate roster's hash,
and a list of pairs of round number and active roster hash.<br/>
This data SHALL be used to track round numbers and the rosters used in determining the consensus.<br/>


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| candidate_roster_hash | [bytes](#bytes) |  | The SHA-384 hash of a candidate roster. <p> This is the hash of the roster that is currently being considered for adoption.<br/> A Node SHALL NOT, ever, have more than one candidate roster at the same time. |
| round_roster_pairs | [RoundRosterPair](#com-hedera-hapi-node-state-roster-RoundRosterPair) | repeated | A list of round numbers and roster hashes.<br/> The round number indicates the round in which the corresponding roster became active <p> This list SHALL be ordered by round numbers in descending order. |






<a name="com-hedera-hapi-node-state-roster-RoundRosterPair"></a>

### RoundRosterPair
A pair of round number and active roster hash.
<p>
This message SHALL encapsulate the round number and the hash of the
active roster used for that round.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| round_number | [uint64](#uint64) |  | The round number. <p> This value SHALL be the round number of the consensus round in which this roster became active. |
| active_roster_hash | [bytes](#bytes) |  | The SHA-384 hash of the active roster for the given round number. <p> This value SHALL be the hash of the active roster used for the round. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->



