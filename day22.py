#Problem — Find the node where the cycle begins
def detect_cycle_start(head):
    slow=fast=head
    while fast and fast.next:
        slow=slow.next
        fast=fast.next.next
        if slow==fast:
            slow2=head
            while slow2!=slow:
                slow2=slow2.next
                slow=slow.next
            return slow
    return None