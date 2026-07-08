# Is the LinkedList a palindrome?
def isPalindrome(head):
    # Find the middle of the linked list
    slow, fast = head, head
    while fast and fast.next:
        slow = slow.next
        fast = fast.next.next

    # Reverse the second half of the linked list
    prev = None
    curr = slow
    while curr:
        nxt = curr.next
        curr.next = prev
        prev = curr
        curr = nxt

    # Compare the first half and the reversed second half
    left, right = head, prev
    while right:  # Only need to compare until the end of the second half
        if left.val != right.val:
            return False
        left = left.next
        right = right.next

    return True