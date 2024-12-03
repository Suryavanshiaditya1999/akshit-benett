```
Jenkins :-

Jenkins is an open-source automation tool used in CI/CD pipelines to automate building, testing, and deploying software. It supports extensive plugins and is crucial in DevOps workflows.
```

```
How ?
Jenkins automates the steps in software development by integrating with various tools, running tests, and deploying code automatically, helping developers quickly deliver updates and maintain code quality.
```

```
How to manage jenkins  ?
    You manage Jenkins by setting up jobs, configuring pipelines, and using plugins to customize and automate your CI/CD processes. The Jenkins dashboard allows you to monitor builds and manage tasks easily.
```

```
PlUGIN CATEGORIES

Build Tools: Automate build processes (e.g., Maven ).
SCM: Integrate with Git, SVN, etc.
User Interface: Enhance the Jenkins UI.
Notifications: Send build alerts via email, Slack, etc.
Reporting: Generate reports for test results, code coverage, etc.
Deployment: Automate software deployment.
Security: Manage user roles and access control.
```

```
Build Management | Parameterized

 Build Management: Plugins in this category help automate and manage the build process, such as compiling code, running tests, and packaging software (e.g., Maven, ).
Parameterized: These plugins allow you to configure Jenkins jobs with dynamic input parameters, making builds flexible by accepting different inputs like file paths, branch names, or environment settings during execution.
Access Control plugins in Jenkins manage user permissions and roles, allowing you to restrict access to specific features and jobs. This ensures that only authorised users can modify configurations and trigger builds, enhancing security.
```

```
Authentication  and Authorization

Authentication in Jenkins verifies user identities through credentials like usernames and passwords, ensuring that users are who they claim to be. 
Authorization determines what authenticated users are allowed to do, managing their permissions and access levels within Jenkins.
```

```
Software bugs cost 
Bugs can be costly, especially if found later in the development process. The cost typically increases through the following stages

Plan: Identifying requirements early can prevent bugs, but failure to do so can lead to misunderstandings and rework.
Define: Poorly defined specifications may result in design flaws, leading to higher costs for corrections.
Design: Bugs found in the design phase can lead to redesign efforts, which are less costly than fixing them later.
Develop: Fixing bugs during development can be expensive, as they may require significant code changes.
Test: Bugs detected during testing can lead to delays and increased costs for retesting and fixing.
Integrate: Bugs found during integration may require revisiting multiple components, increasing overall costs.
```

```
 9.  The idea behind CI 

CI is to automate the integration of code changes frequently to detect bugs early and improve software quality.
1. Detect Bugs Early
2. Improve Software Quality
3. Faster Feedback
4. Streamline Collaboration
```

```
10. Tiggers :  In Jenkins, triggers are mechanisms that initiate a job or build automatically based on specific events


Poll VCS: Jenkins regularly checks the version control system (VCS) for changes, triggering a build when new code is detected.
Push Notification: A build is triggered immediately when code changes are pushed to the repository, ensuring faster integration and feedback.
```

```
11. Checks | Prebuild
    
    This step involves validating the environment and configurations before starting the build process, ensuring that all necessary dependencies are met and that the codebase is ready for building.

Code Compile: The process of converting source code into executable code, ensuring that it can run without errors.
Credential Scanning: A security measure that checks for sensitive information (like passwords or API keys) in the codebase to prevent accidental exposure.
Dependency Scanning: Analysing the project's dependencies to identify vulnerabilities or outdated libraries that could pose security risks.
Licence Analysis: Reviewing open-source licences of dependencies to ensure compliance and avoid legal issues in the software distribution.
Static Analysis: The process of examining code for potential errors, vulnerabilities, and code quality issues without executing it.
Code Coverage: A measure of how much of the code is tested by automated tests, helping to identify untested parts and improve test effectiveness.

```

```
12. Post-Build Check
      This stage verifies the outcome of the build process by running tests, validating outputs, and ensuring that the build meets the required quality standards before deployment or release.

Health Validation: This process checks the overall health and status of the application after deployment to ensure it is functioning correctly.

Sanity Test: A quick check to verify that specific functionalities are working after changes, ensuring no major issues have been introduced.

Functional Test: This testing verifies that the application behaves as expected by validating its functionalities against requirements.

Integration Test: This stage checks the interactions between different modules or services to ensure they work together seamlessly.

Dynamic Application Security Testing : This type of testing assesses the security of a running application by simulating external attacks to identify vulnerabilities.
```

```
13. Notification : Email -> Async Communication

Code Analysis Result: Provides insights into code quality and identifies issues like vulnerabilities and code smells.

Code Coverage Report: Shows the percentage of code tested by automated tests, highlighting untested areas.

Code Documentation Update: Ensures that code changes are accurately reflected in the documentation.

Code Merge Notification: Alerts team members when code changes are merged into the main branch.

Build and Deployment Status Update: Communicates the success or failure of builds and deployments.

Pull Request Review: Evaluates code changes in pull requests, allowing for feedback before merging.
```

```
14. Real-Time Notification -> Sync Communication
    
CI/CD Pipeline Updates: Notifications about the status and progress of the CI/CD pipeline, including any issues or completions
Automated Test Results: Reports on the outcomes of automated tests, indicating which tests passed or failed.
Release Coordination: Communication regarding the planning and timing of software releases, ensuring alignment among team members.
Security Alerts: Notifications about potential security vulnerabilities or breaches detected during testing or monitoring.
Server or Application Downtime: Alerts informing the team about any outages or downtime affecting servers or applications.
Code Review Feedback: Comments and suggestions provided during code reviews, helping improve code quality before merging.
```

```
15. Data vs Information
      Data consists of raw facts without context, while information is processed data organize to convey meaning and support decision-making.

```

```
16.Artefacts Server

 Universal: Refers to systems or solutions that are applicable across various platforms and environments, ensuring broad compatibility.
HA and DR : HA ensures continuous operational uptime by minimize downtime, while DR involves strategies to recover systems and data after a failure.
Security: The measures and protocols implemented to protect systems, data, and networks from 
unauthorized access, breaches, and threats.
Integration: The process of connecting different systems, applications, or services to work together seamlessly and share data effectively.
Scalability: The ability of a system to handle increased load or accommodate growth without sacrificing performance or requiring major changes.
```

```
17. Reporting Server
   A server that generates and manages reports from data sources, providing insights for business intelligence and decision-making.

SonarQube :  SonarQube is preferred by developers because it provides continuous inspection of code quality, identifying bugs, vulnerabilities, and code smells, while offering detailed insights and metrics to improve code maintainability and readability.
```

```
18.Minimalist CI workflow
     A minimalist CI workflow focuses on simplicity and efficiency, typically involving the following steps


1. Code Commit: Developers commit code changes to the version control system.
2. Automated Build: The CI server automatically builds the project upon code commit.
3. Automated Tests: The server runs automated tests to validate the build.
4. Report Results: The CI server provides feedback on the build and test results.
5. Deployment (Optional): If successful, the code may be automatically deployed to a staging environment.

```
```
19.Extensive CI workflow

An extensive CI workflow includes multiple steps and processes to ensure thorough testing and quality assurance. It typically involves

Code Commit: Developers commit code changes to a version control system.

Code Review: Automated code review processes or peer reviews are conducted to ensure code quality.

Automated Build: The CI server automatically builds the project upon code commit.

Static Code Analysis: Tools analyse the code for potential issues, such as code smells or security vulnerabilities.

Automated Tests: The server runs unit tests, integration tests, and end-to-end tests to validate functionality.

Test Reporting: Test results are reported with details on successes and failures.

Performance Testing: Performance tests assess how the application behaves under load.

Artefact Creation: Build artefacts (e.g., binaries, packages) are created for further use.

Deployment to Staging: If all tests pass, the build is deployed to a staging environment for further testing.

User Acceptance Testing (UAT): Stakeholders test the application in the staging environment to validate requirements.

Production Deployment: Upon approval, the code is deployed to the production environment.

Monitoring and Alerts: Continuous monitoring of the application in production for performance and issues.

Feedback Loop: Collecting feedback from users and monitoring results to inform future development
```
