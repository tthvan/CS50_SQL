SELECT friend_id
FROM friends
WHERE user_id = (
    SELECT id from users
    where username = 'lovelytrust487'
)
INTERSECT
SELECT friend_id
FROM friends
WHERE user_id = (
    SELECT id from users
    where username = 'exceptionalinspiration482'
);
