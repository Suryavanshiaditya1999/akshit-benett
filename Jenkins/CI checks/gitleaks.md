# Complete Documentation on Gitleaks

[Download](https://github.com/gitleaks/gitleaks)

## What is Gitleaks?

**Gitleaks** is an open-source SAST tool designed to detect hardcoded secrets like API keys, passwords, and tokens in Git repositories. It scans Git history, files, and branches to prevent sensitive information from being exposed.

## How Does Gitleaks Work?

Gitleaks scans Git repositories for hardcoded secrets by inspecting the Git history, branches, and files. It looks for patterns that match known types of secrets, such as:

- **AWS Secret Keys**
- **Google Cloud Credentials**
- **GitHub Tokens**
- **Database Passwords**
- **Private SSH Keys**
- **Slack Webhooks**
- **JWT Tokens**

### Regex and Secret Detection

Gitleaks uses **regular expressions (regex)** to detect these patterns. Regex is a powerful tool that allows users to define specific search patterns for strings. In the case of Gitleaks, regex patterns are used to identify secrets by matching them to known formats such as:

- AWS secret keys starting with `AKIA`
- GitHub tokens in formats like `ghp_********`
- Passwords that may follow a specific syntax

These regex patterns are then applied to the Git history, branches, or files to identify any matching text that could be a secret.

#### Example of Regex in Gitleaks:

A sample regex to match an AWS Access Key might look like this:
  -  regex
    ```
    AKIA[0-9A-Z]{16}
    ```

AWS access keys starts with AKIA 
![image](https://github.com/user-attachments/assets/f6623ec3-2333-42d6-8f70-ee18fa27c453)

- So similary `regex` is defined for other patterns as well .

## Basic Usage of Gitleaks

### Scanning a Local Git Repository:
  -  To run gitleaks in verbose mode
    ``` 
    gitleaks detect --source . -v
    ```

  -  Scanning a Remote Git Repository
    ```
    gitleaks detect --source=https://github.com/username/repository.git
    ```

  - Scanning a Specific Branch:
    ```
    gitleaks detect --source=https://github.com/username/repository.git --branch=my-feature-branch
    ```

  - Skipping gitleaks Test
    ```
    gitleaks detect --exit-code 0
    ```

### CI PIPELINE

```
pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Pulling the Git repository
                git 'https://github.com/username/repository.git'
            }
        }
        stage('Gitleaks Scan') {
            steps {
                script {
                    // Run Gitleaks scan
                    sh 'gitleaks detect --exit-code 0'
                }
            }
        }
    }

    post {
        always {
            // Archive Gitleaks reports or any relevant artifacts if needed
            // archiveArtifacts artifacts: '**/gitleaks_report.json', allowEmptyArchive: true
        }
    }
}

```

### HOW Gitleaks Throws Error

Shows you exact line number and what secret it found

![image](https://github.com/user-attachments/assets/1e5ebf4d-e58e-4945-9f1f-90b139401df2)


### TO Generate gitleaks report


```
gitleaks detect --report-path gitleaks-report.json
```
![image](https://github.com/user-attachments/assets/2a9590c6-68d5-424d-810e-ba072e96d8bc)


- Use Baseline for detecting

  ![image](https://github.com/user-attachments/assets/e704fb68-03e5-46e7-ad43-63d19d8ccc66)

  ```
  gitleaks detect --baseline-path gitleaks-report.json --report-path findings.json
  ```


