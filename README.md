# Mini Video Project Submission App

This is a simple Rails app that simulates a video project ordering system. Clients can choose video types, submit their project with a footage link, and simulate a payment. A Project Manager (PM) is assigned automatically, and a background notification is created.

---

## Tech Stack

- **Ruby**: 3.2.2  
- **Rails**: 7.2.2  
- **Database**: MySQL  
- **Front-end**: Bootstrap 5, StimulusJS  
- **Testing**: RSpec

---

## Setup Instructions

Follow these steps to get the project running locally:

### 1. Clone the Repository

```bash
git clone https://github.com/your-username/video-project-app.git
cd video-project-app
```
### 2. Install Dependencies

```bash
bundle install
```

### 3. Set Up the Database

```bash
rails db:create
rails db:migrate
rails db:seed
```
### 4. Start the Rails Server

```bash
bin/dev
```

### Stimulus Setup

The app uses Hotwire/Stimulus for interactive features like real-time payment amount updates.
No extra config is required. it’s already wired using app/javascript/controllers/payment_controller.js.

### If needed:

```bash
bin/rails stimulus:manifest:update
```

## Features

Clients can create a new video project by:
- Naming the project
- Adding a footage link (any URL)
- Selecting one or more video types
- A simulated payment modal shows the total cost before submission

#### After submission:
- A new project is created
- The default PM (linked to the client) is assigned
- A background notification is created for the PM (async job)
- Clients can see a list of all their submitted projects


### Test Coverage

RSpec has been used to test the following:

#### Model validations and associations:
Client, Project, Video, VideoType, Notification

#### Background job:
```CreateNotificationJob``` ensures a notification is created correctly

#### Controller logic:
Project creation and redirection flow

To run tests:
```bash
bundle exec rspec
```
### Notes

- Client login is simulated (```Client.first``` is used for now)
- PM assignment is defaulted based on the client
- No actual payment integration payment is simulated only via a Bootstrap modal
