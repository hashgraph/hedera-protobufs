## Table of Contents

- [schedule_create.proto](#schedule_create-proto)
    - [ScheduleCreateTransactionBody](#proto-ScheduleCreateTransactionBody)
  



<a name="schedule_create-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## schedule_create.proto
#

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).


<a name="proto-ScheduleCreateTransactionBody"></a>

### ScheduleCreateTransactionBody
Create a new <i>schedule entity</i> (or simply, <i>schedule</i>) in the network's action queue.
Upon <tt>SUCCESS</tt>, the receipt contains the `ScheduleID` of the created schedule. A schedule
entity includes a <tt>scheduledTransactionBody</tt> to be executed.
When the schedule has collected enough signing Ed25519 keys to satisfy the schedule's signing
requirements, the schedule can be executed.

If Long Term Scheduled Transactions are enabled and <tt>wait_for_expiry</tt> is set to <tt>true</tt>, then the schedule
will execute at it's <tt>expiration_time</tt>.

Otherwise it will execute immediately after the transaction that provided enough Ed25519 keys, a <tt>ScheduleCreate</tt>
or <tt>ScheduleSign</tt>.

Upon `SUCCESS`, the receipt also includes the <tt>scheduledTransactionID</tt> to
use to query for the record of the scheduled transaction's execution (if it occurs).

The expiration time of a schedule is controlled by it's <tt>expiration_time</tt>. It remains in state and can be queried
using <tt>GetScheduleInfo</tt> until expiration, no matter if the scheduled transaction has
executed or marked deleted. If Long Term Scheduled Transactions are disabled, the <tt>expiration_time</tt> is always
30 minutes in the future.

If the <tt>adminKey</tt> field is omitted, the resulting schedule is immutable. If the
<tt>adminKey</tt> is set, the <tt>ScheduleDelete</tt> transaction can be used to mark it as
deleted. The creator may also specify an optional <tt>memo</tt> whose UTF-8 encoding is at most
100 bytes and does not include the zero byte is also supported.

When a <tt>scheduledTransactionBody</tt> is executed, the
network only charges its payer the service fee, and not the node and network fees. If the
optional <tt>payerAccountID</tt> is set, the network charges this account. Otherwise it charges
the payer of the originating <tt>ScheduleCreate</tt>.

Two <tt>ScheduleCreate</tt> transactions are <i>identical</i> if they are equal in all their
fields other than <tt>payerAccountID</tt>.  (For the <tt>scheduledTransactionBody</tt> field,
"equal" should be understood in the sense of
gRPC object equality in the network software runtime. In particular, a gRPC object with <a
href="https://developers.google.com/protocol-buffers/docs/proto3#unknowns">unknown fields</a> is
not equal to a gRPC object without unknown fields, even if they agree on all known fields.)

A <tt>ScheduleCreate</tt> transaction that attempts to re-create an identical schedule already in
state will receive a receipt with status <tt>IDENTICAL_SCHEDULE_ALREADY_CREATED</tt>; the receipt
will include the <tt>ScheduleID</tt> of the extant schedule, which may be used in a subsequent
<tt>ScheduleSign</tt> transaction. (The receipt will also include the <tt>TransactionID</tt> to
use in querying for the receipt or record of the scheduled transaction.)

Other notable response codes include, <tt>INVALID_ACCOUNT_ID</tt>,
<tt>UNSCHEDULABLE_TRANSACTION</tt>, <tt>UNRESOLVABLE_REQUIRED_SIGNERS</tt>,
<tt>INVALID_SIGNATURE</tt>. For more information please see the section of this documentation on
the <tt>ResponseCode</tt> enum.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| scheduledTransactionBody | [SchedulableTransactionBody](#proto-SchedulableTransactionBody) |  | The scheduled transaction |
| memo | [string](#string) |  | An optional memo with a UTF-8 encoding of no more than 100 bytes which does not contain the zero byte |
| adminKey | [Key](#proto-Key) |  | An optional Hedera key which can be used to sign a ScheduleDelete and remove the schedule |
| payerAccountID | [AccountID](#proto-AccountID) |  | An optional id of the account to be charged the service fee for the scheduled transaction at the consensus time that it executes (if ever); defaults to the ScheduleCreate payer if not given |
| expiration_time | [Timestamp](#proto-Timestamp) |  | An optional timestamp for specifying when the transaction should be evaluated for execution and then expire. Defaults to 30 minutes after the transaction's consensus timestamp.

Note: This field is unused and forced to be unset until Long Term Scheduled Transactions are enabled - Transactions will always expire in 30 minutes if Long Term Scheduled Transactions are not enabled. |
| wait_for_expiry | [bool](#bool) |  | When set to true, the transaction will be evaluated for execution at expiration_time instead of when all required signatures are received. When set to false, the transaction will execute immediately after sufficient signatures are received to sign the contained transaction. During the initial ScheduleCreate transaction or via ScheduleSign transactions.

Defaults to false.

Setting this to false does not necessarily mean that the transaction will never execute at expiration_time. For Example - If the signature requirements for a Scheduled Transaction change via external means (e.g. CryptoUpdate) such that the Scheduled Transaction would be allowed to execute, it will do so autonomously at expiration_time, unless a ScheduleSign comes in to "poke" it and force it to go through immediately.

Note: This field is unused and forced to be unset until Long Term Scheduled Transactions are enabled. Before Long Term Scheduled Transactions are enabled, Scheduled Transactions will _never_ execute at expiration - they will _only_ execute during the initial ScheduleCreate transaction or via ScheduleSign transactions and will _always_ expire at expiration_time. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->


