# PairProposal (Working Name)

### Users
- can have strong/weak topics
- can join session as tutor or tutee
- tutee by default, can be set as tutor by admin
- tutor can set open tutor times
- users see all upcoming sessions on their show page
- tutee can see tutors and pick from times to set up session
- tutor show page with form to create session

### Topics
- only admins can CUD topics
- can be either a strong point or weak point for a user

### Session
- belongs to a tutor and tutee
- has duration, location

### Analysis
- users can see tutors by topic '/tutors/?topic=Battleship'

### Admins
- can see a list of all users
- can delete users
- can set user roles
- can CUD topics

### Extensions
- can see tutors by availability day
- can see by topic and availability
- user can rate sessions
- overall rating for tutor (calculated by session rating)
