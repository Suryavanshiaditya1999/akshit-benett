# ASSIGNMENTS AND ACTIVITIES

## LAB 1

```
Install Jenkins With all the suggested Plugins Manually.
```

## LAB 2

```
Create a Jenkins Job that will monitor a repository if a code has been committed in the last 5 minutes
Ensure that we maintain only the last 10 executions
By default, this job should count the number of words in the README.md file
If a person manually invokes the Job it should ask for a file name and the file name being asked job should show the number of words in that file
```

## LAB 3

```
Lab 02 | Manage Jenkins
Executer, Authz

In this lab, we will explore how we can update Jenkins settings to better utilize Jenkins:

Your Jenkins setup should have your team name at the top "Team XXXXXXXXX".
It should be capable of executing 5 tasks at a time
You should be able to access Jenkins via port "8081"
Put a restriction in your Jenkins setup that a project can only be created with a convention that a team name should be prefixed (<team>.)
Enable Maven support in your Jenkins setup 
```

## LAB 3

```
Lab 03 | In this lab we will explore various plugins of Jenkins :

Create a day1 folder and move all your projects to that folder.
Create a Maven type job to compile your project - spring3Hibernate
Install Build Monitor view plugin to view the status of various jobs in one single place.
Install Monitoring Plugin to visualize the health of Jenkins.
Also enable the capability to fetch the branches dynamically.
```

## LAB 4

```
Lab 04 | 

--Job 1-  Create a job that will monitor https://github.com/OT-MICROSERVICES/salary-api if there is a code commit and in that case will get executed
--Job 2-  On successful completion of the previous job, this job should run the test cases. If possible display the test results
--Job 3-  On successful completion of the previous job, this job should build the code and should show the artifact generated.
```

## **ASSIGNMENT 1**

```
Topics Covered: (Shell Scripting, Git, Freestyle Job, Parameters, Upstream/Downstream, Slack + Email Notification)
Part 1:-
Create a Jenkins job via which you will be able to perform the below operations & if any of the steps fail a Slack and Email notification should be sent:
Create a branch
List all branches
Merge one branch with another branch
Rebase one branch with another branch
Delete a branch
Part 2:-
Create a Jenkins job that takes input parameter string <Ninja Name> and it should -
Create a file
Add content in the file "<Ninja Name> from DevOps Ninja"
      	
Create another Jenkins job that should -
Publish the file content created in job 1 using a web server
Configurations should be such that -
The second job must be triggered automatically only after completing the first job successfully.
If any steps fail, a Slack and Email notification should be sent.
If all jobs run successfully, Slack and Email notifications should be sent
```

## **ASSIGNMENT 2**

```
Topics Covered:  (User Authentication, User Authorization)
Part 1
There is an organization which has 3 teams based on user roles :
            - Developer
            - DevOps
            - Testing
First, you need to create 9 Jenkins jobs. Each job will print its job name, and build number.
            For the Developer, create 3 dummy jobs, visible in the developer view
                job1:- dev-1
                job2:- dev-2
                job3:- dev-3
            For Testing, create 3 dummy jobs, visible in the testing view
                job1:- test-1
                job2:- test-2
                job3:- test-3
            For DevOps, create 3 dummy jobs, visible in the devops view
                job1:- devops-1
                job2:- devops-2
                job3:- devops-3
Users in each team:
            developer: [ They can see only dev jobs, can build it, see workspace and configure it ]
                - developer-1
                - developer-2
            testing: [ They can see all test jobs, can build it, see workspace and can configure it, | They can also view dev jobs ]
                - testing-1
                - testing-2
            devops:  [ They can see all devops jobs, can build it, see workspace and can configure it, | They can also view dev and test jobs  ]
                - devops-1
                - devops-2
            Administration
                -  admin-1 [ It will have full access ]
See what Authorization strategy suits it and implement it.
Also, go through all authorization strategies.
Legacy mode
Project Based
Matrix Based
Role-Based
Part 2
Enable SSO with Google for admin user
```

## LAB 5

```
What you will do:

In this lab we will create a Jenkins Declarative Pipeline exploring basic elements of pipeline :

Create a Jenkins pipeline that will print Hello World 
Add a parameter in Jenkins Pipeline that will take a name and print Hello <name>
Add an option to take user input while running the pipeline if we want to fail the pipeline
Add a stage to print success/failure message
Update pipeline to execute every 5 minutes
Ensure that if pipeline is running for more than a minute it should fail.

Send email/slack notification for success and failure separately to different channels/mails.
```

## LAB 6

```
What you will do:

In this lab we will create a Jenkins Declarative Pipeline for CI  :

Create a Jenkins Pipeline that will kick start the CI process if a commit is made.
Add a Stage in pipeline to perform to Code stability.
Add a Stage in pipeline to perform code quality analysis.
Add a Stage in pipeline to perform code coverage analysis.
Add a Stage in pipeline to generate report for code quality & analysis.
Add a Stage in pipeline to send Slack and Email notification.
```

## LAB 7

```
What you will do:

In this lab we will create a Jenkins Scripted Pipeline for CI  :

Create a Jenkins Pipeline that will kick start the CI process if a commit is made.
Add a Stage in pipeline to perform to Code stability.
Add a Stage in pipeline to perform code quality analysis.
Add a Stage in pipeline to perform code coverage analysis.
Add a Stage in pipeline to generate report for code quality & analysis.
Add a Stage in pipeline to send Slack and Email notification.
```

## LAB 8

```
1. Create a Jenkins Declarative Pipeline that will kick start the CI process if a commit is made.
2. Add all the CI stages as in the previous activities
3. Add a CD stage to deploy the generated artifact to a tomcat/java server
4. Use ansible playbook to manage deployment and call it in the Jenkins pipeline.
```

## ASSIGNMENT 3

```
    Create a Declarative CI  pipeline for java based project that contains various stages like
Code checkout
Run the below stages in parallel
Code stability.
Code quality analysis.
Code coverage analysis.
Generate a report for code quality & analysis.
Publish artifacts.
Send Slack and Email notifications.
The user should have the option to skip various scans in the build execution. Before publishing there should be an approval stage to be set in place to approve or deny the publication and if approved the step should execute and the user should be notified post successful/failed
Optional:- Repeat the same using Scripted Pipeline.

```


## ASSIGNMENT 4

```
Topics Covered:  (Configuring Agents, Distributing Loads, Executors, Assigning Nodes)

1] Configure an Ubuntu node using the execution of a command on the master method.
         - Make sure at any point in time, a maximum of 5 jobs can be executed on this node.
         - Assign this node to Assignment 1: Part1
2] Configure a RHEL node using  Launch slave agents via SSH method.
         - Make sure at any point of time a maximum of 2 jobs can be executed on this node.
         - Assign this node to Assignment 2: Part2
3] Configure a CentOS node using Launch slave agents via SSH method.
         - Make sure at any point in time a maximum of 3 jobs can be executed on this node.
         - Assign this node to Assignment 3
- Ensure that if Jenkins job is running between 9 am-6 pm then only it should be executed on the newly added node, else on the master node.
```

