## Table of Contents

- [schedule_service.proto](#schedule_service-proto)
    - [ScheduleService](#proto-ScheduleService)
  



<a name="schedule_service-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## schedule_service.proto
#

### Keywords
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC2119](https://www.ietf.org/rfc/rfc2119).

 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->


<a name="proto-ScheduleService"></a>

### ScheduleService
Transactions and queries for the Schedule Service

The Schedule Service allows transactions to be submitted without all the required signatures and
allows anyone to provide the required signatures independently after a transaction has already
been created. The transactions can be executed immediately when all required signatures are received
or at a future date if Long Term Scheduled Transactions are enabled.

Execution:

Scheduled Transactions are executed in two different modes.

1. If Long Term Scheduled Transactions are enabled and <tt>wait_for_expiry</tt> was set to <tt>true</tt> on the
   <tt>ScheduleCreate</tt>, then the transaction will be executed at the <tt>expiration_time</tt> specified on the
   <tt>ScheduleCreate</tt>.

2. Otherwise Scheduled Transactions are executed once all required signatures are collected and witnessed.
   Every time new signature is provided, a check is performed on the "readiness" of the execution.
   The Scheduled Transaction will be executed immediately after the transaction that triggered it.

NOTICE:
A Scheduled Transaction being ready to execute, or even not ready to execute, at the time a <tt>ScheduleCreate</tt> or
<tt>ScheduleSign</tt> comes in does not guarantee it will stay that way. Any number of things can happen over time that
impact the transaction.

For example, account keys can change, accounts can be deleted, and account balances can change.

A particularly noteworthy case is if Long Term Scheduled Transactions are enabled and signature requirements for a Scheduled
Transaction change such that existing signatures become sufficient to allow the transaction to go through. In this case the transaction
will execute at expiration_time unless a ScheduleSign comes in to push it through.

Transaction Record:

If a Scheduled Transaction is executed immediately following the transaction that provided all required signatures,
the timestamp of the Scheduled Transaction will be equal to consensusTimestamp + 1 nano, where
consensusTimestamp is the timestamp of the transaction that triggered the execution.

The Transaction ID of the Scheduled Transaction will have the scheduled property set to true and
inherit the <tt>transactionValidStart</tt> and <tt>accountID</tt> from the <tt>ScheduleCreate</tt> transaction.

The <tt>scheduleRef</tt> property of the transaction record will be populated with the <tt>ScheduleID</tt> of the
Scheduled Transaction.

Post execution:

After execution, a Scheduled Transaction will remain in state and can be queried using <tt>GetScheduleInfo</tt> until expiration.

Expiry:

The expiration time of a schedule is controlled by it's <tt>expiration_time</tt>. If Long Term Scheduled Transactions are disabled,
the <tt>expiration_time</tt> is always 30 minutes in the future.

Once a given Scheduled Transaction expires, it will be removed from the ledger and any upcoming
operation referring the ScheduleID will resolve to INVALID_SCHEDULE_ID.

| Method Name | Request Type | Response Type | Description |
| ----------- | ------------ | ------------- | ------------|
| createSchedule | [Transaction](#proto-Transaction) | [TransactionResponse](#proto-TransactionResponse) | Creates a new Schedule by submitting the transaction |
| signSchedule | [Transaction](#proto-Transaction) | [TransactionResponse](#proto-TransactionResponse) | Signs a new Schedule by submitting the transaction |
| deleteSchedule | [Transaction](#proto-Transaction) | [TransactionResponse](#proto-TransactionResponse) | Deletes a new Schedule by submitting the transaction |
| getScheduleInfo | [Query](#proto-Query) | [Response](#proto-Response) | Retrieves the metadata of a schedule entity |

 <!-- end services -->


