#Problem 1 — Reverse a LinkedList (must-know)
#key idea : initiate current value,walk the list, flipping each node's next pointer to point backwards. Track 3 things: previous, current, and the next node (so you don't lose the rest).

def reverse(head):
    prev=None
    curr=head
    while curr:
        nxt=curr.next
        curr.next=prev
        prev=curr
        curr=nxt
    return prev
#problem 2- Problem 2 — Find the middle (slow/fast pointers)
#key idea : use two pointers ,slow fast and then will see
def middle(head):
    slow,fast=head,head
    while fast and fast.next:
        slow=slow.next
        fast=fast.next.next
    return slow
#Problem 3 — Detect a cycle (Floyd's algorithm)
#key idea=slow and fast pointers, if they meet then there is a cycle
def hasCycle(head):
    slow=fast=head
    while fast and fast.next:
        slow=slow.next
        fast=fast.next.next
        if slow=fast:
            return True
    return False