# WDI 17 Student Homework Repository

Welcome to the GA London WDI 17 student homework repository. This is the place we are going to monitor the completion of your homework.

## How to use

First things first. [Fork](https://help.github.com/articles/fork-a-repo) this repository and clone your fork to your machine.

In the root folder, create a folder with your name, but make it unambiguous. For instance, if there were two students called "Michael" in the class, I would name my folder something like 'michaelp' or 'michael_pavling' to make it clear it was for my work.

Then each day, inside your own assignments folder, create folders for the day of the course named along the lines of "w1d2" (for week one, day two) - the name/number of the day should be written on the board by the instructor each morning for your reference (above the itinerary for the day).

Inside the daily folder, create folders for your homework assingment.

So your folder structure should look something like this:

    |- student_repository_root
       |- assignments
          |- _completed_assignments
          |  |- ... examples of completed assignments for your reference
          |           supplied by the instructors the day after the homeworks are completed
          |
          |- gerrymathe
          |  |- w1d2
          |  |  |- git_homework
          |  |  |  |- ... files here
          |  |- w1d3
          |     |- calculator_homework
          |        |- ... files here
          |
          |- steveyblam
             |- ... other students' work - don't edit anything outside of your path!

## Submitting work

At the end of each day (or first thing each morning), ensure all of your homework is committed to git and pushed to your github fork of the student work repository.

DO NOT EDIT OR REMOVE OTHER STUDENTS' DIRECTORIES! (or alter any of the completed examples). If you do, and you commit the changes, they will be included in your pull requests and risk breaking things for everyone else. At best, your PR will be rejected, and you will need to restore your fork to a good working state).

Then create a [pull request](https://help.github.com/articles/using-pull-requests) from your fork. This will automatically include all the commits you have made to the repository.

The instructional team will then merge your pull request, and use the main repository as the source to monitor your work. If you do not issue a pull request, it will appear to us that you have not completed the assignments for the previous day, and it will be recorded as such.

If you have any problems with submitting assignments, get our assistance soonest.


## Updating your fork (getting updated homework solutions)

You forked the ga-students repository to your own Github account by following the instructions above, and cloned it to your local machine. Now you need to get updates from the parent fork, so you can get homework solutions.

We do this by adding a *remote* to our local repository, and fetching changes from it.

### Initial setup

Add an upstream remote by visiting the ga-students WDI repo on Github, and copying the *SSH clone URL* from the sidebar. Then change into your local repo that you cloned from your fork, and run the following:

```shell
    $ git remote -v
    # Shows current remotes; you will have two named 'origin'
    $ git remote add upstream git@github.com:ga-students/WDI_LDN_12_HOMEWORK.git
    $ git remote -v
    # You should see your upstream remote added.
```

### Getting updates

You only have to perform the initial setup once; once you've done that, to get the remote changes, run these two commands in your local repo:

```shell
    $ git pull upstream master
```