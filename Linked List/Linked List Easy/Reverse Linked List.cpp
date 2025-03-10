class Solution {
public:
    ListNode* reverseList(ListNode* head)
    {
        ListNode* Current = head;
        ListNode* Previous = NULL;
        ListNode* Next = NULL;

        while (Current != NULL)
        {
            Next = Current->next;
            Current->next = Previous;
            Previous = Current;
            Current = Next;
        }

        return Previous;
    }
};