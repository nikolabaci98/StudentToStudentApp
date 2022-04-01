Original App Design Project - README Template
===

# Qlinks

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description
An app where students can join and share tips, tricks, past exams, join discussion boards, keep up to date with campus wide updates and meet study-buddies.

### App Evaluation
- **Category:** Social Networking 
- **Mobile:** This app would be primarily developed for mobile but would perhaps be just as viable on a computer, such as Reddit or other similar apps. Functionality would be same across all devices.
- **Story:** Connects Queens College students. The users can post their interests and engage with other with similar interests. In addition students can post resources, tutoring services, and additional help posts.
- **Market:** Current Students enrolled in Queen College. 
- **Habit:** This app could be used as often or unoften as the user wanted depending on how deep their social life is, and what exactly they’re looking for.
- **Scope:** At first we will start as a social app for students enrolled in Queens College, interested in Computer Science. This can evolve into a larger app which includes all CUNY/SUNY students and multiple departments.  

## Product Spec

### 1. User Stories (Required and Optional)
**Required Must-have Stories**
- Users can Sign up/ Log in with a valid QC email.
- Users can interact with posts of their interest.
- Users can interact with class resources uploaded by their peers.
- A live chat window to post miscellaneous comments/services.
- Profile pages for each user


### 2. Screen Archetypes
- Login
- Register - User signs up or logs into their account
  - Upon Download of the application, the user is prompted to log in to gain access to their profile information.
  - User stays logged in across restarts. 
- Profile Screen
  -Allows user to upload a photo and fill in information that is interesting to them and others
- Home Feed Screen
  - Allows users to create a post and interact with other posts. 
- Resources Screen 
  - Allows user to create and interact with resources of different Computer Science courses.
- Tutoring Chat
  - A live chat where students can post tutoring services/inqueries.

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Profile
* Feed
* Resources
* Tutoring

**Flow Navigation** (Screen to Screen)

* Forced login -> Account creation if no log in is available
* Profile -> Text field to be modified.
* Resources -> Text field to upload resources
* Tutoring -> Jumps to a live chat for tutoring services
Settings -> Toggle settings

## Wireframes
[Add picture of your hand sketched wireframes in this section]
<img src="YOUR_WIREFRAME_IMAGE_URL" width=600>

### [BONUS] Digital Wireframes & Mockups

### [BONUS] Interactive Prototype

## Schema 
[This section will be completed in Unit 9]
### Models

Post
Attempt | #1 | #2 | #3 | #4 | #5 | #6 | #7 | #8 | #9 | #10 | #11
--- | --- | --- | --- |--- |--- |--- |--- |--- |--- |--- |---
Seconds | 301 | 283 | 290 | 286 | 289 | 285 | 287 | 287 | 272 | 276 | 269
| --- | --- | --- 
|Property       |Type               |Description
|objectId       |String             |unique id for the user post (default field)
|author         |Pointer to User    |image author
|image          |File               |image that user posts
|caption        |String             |image caption by author
|commentsCount  |Number             |number of comments that has been posted to an image
|likesCount     |Number             |number of likes for the post
|createdAt      |DateTime           |date when post is created (default field)
|updatedAt      |DateTime           |date when post is last updated (default field)

### Networking

**List of network requests by screen**

**Home Feed Screen**

(Read/GET) Query all posts where user is author
```
let query = PFQuery(className:"Post")
query.whereKey("author", equalTo: currentUser)
query.order(byDescending: "createdAt")
query.findObjectsInBackground { (posts: [PFObject]?, error: Error?) in
   if let error = error { 
      print(error.localizedDescription)
   } else if let posts = posts {
      print("Successfully retrieved \(posts.count) posts.")
  // TODO: Do something with posts...
   }
}
```
-  (Create/POST) Create a new like on a post
-  (Delete) Delete existing like
-  (Create/POST) Create a new comment on a post
-  (Delete) Delete existing comment
- Create Post Screen
- (Create/POST) Create a new post object
- Profile Screen
- (Read/GET) Query logged in user object
- (Update/PUT) Update user profile image
