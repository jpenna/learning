###Stop the function

* throw = legacy
* assert = used for internal errors (contract error)
* require = preconditions
* revert = other business errors (when condition is more sofisticated than condition)

All have the same consequences:

1 - Refund message to sender
2 - State changes are reverted
3 - Execution is interrupted
4 - Gas is spent
