# PairProposal (Working Name)

### Users
- can have strong topics (needs topics)
- can join session as tutor or tutee (needs sessions)
- tutee by default, can be set as tutor by admin x
- tutor can set open tutor times (need tutor_times)
- users see all upcoming sessions on their show page (needs sessions)
- tutee can see tutors and pick from times to set up session (needs times and sessions)
- tutor show page with form to create session

### Topics
- only admins can CUD topics
- can be strong point for a user

### Session
- belongs to a tutor and tutee
- has duration, location

### Analysis
- users can see tutors by topic '/tutors/?topic=Battleship'

### Admins
- can see a list of all users x
- can delete users x
- can set user roles x
- can CUD topics x

### Extensions
- can see tutors by availability day
- can see by topic and availability
- user can rate sessions
- overall rating for tutor (calculated by session rating)
