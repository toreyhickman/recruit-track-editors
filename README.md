# Recruit Track Editors

At Dev Bootcamp, the Curriculum team partners with the teaching staff to ensure that our materials are inline with best practices.  Teachers volunteer to serve as track editors for topics covered in the curriculum (e.g., Ruby, relational databases, etc.).  When issues are raised on or modifications proposed to our phase guides and challenges, Curriculum solicits feedback from the relevant track editors.

Curriculum prefers that at least two teachers are serving on each track.  This project pulls the track editor team lists from GitHub and publishes a report to Slack that indicates whether each track has enough track editors.

## Required Tokens
To run the script, you'll need a GitHub token and the track-editor-bot Slack token.  These are loaded as environment variables using the Dotenv gem.  Set the token values in a `.env` file (not checked in; see the `dotenv` file).

## Running the Script
An executable is provided: `bin/recruit-track-editors`.