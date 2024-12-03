# CI CHECKS

## SAST VS DAST

SAST -> Static Application Security Testing
-  it is static analysis , it is run pre-run Time , code is test at rest 


DAST -> Dynamic Application Security Testing
- It is run during runtime, meaning your application is live, and tools like OWASP ZAP can be used to simulate attacks and identify security vulnerabilities.



| **Category**  | **Tool Name**          | **Description**                                                                                     | **Language/Platform Support**                 | **License**             |
|---------------|------------------------|-----------------------------------------------------------------------------------------------------|-----------------------------------------------|-------------------------|
| **SAST Tools**| **SonarQube**           | Continuous code quality and security analysis tool that detects vulnerabilities in the code.         | Java, C, C++, Python, JavaScript, and more    | Open-source & Commercial |
|               | **Gitleaks**            | A SAST tool for detecting hardcoded secrets like passwords and API keys in Git repositories.         | Any language via Git repositories             | Open-source              |
|               | **Trivy**               | A comprehensive security tool for static analysis of vulnerabilities in containers, code, and IaC.   | Docker, Kubernetes, Terraform, etc.           | Open-source              |
|               | **PMD**                 | Static code analyzer that finds code defects and security issues in Java, Apex, and other languages. | Java, Apex, JavaScript, etc.                 | Open-source              |
| **DAST Tools**| **OWASP ZAP**           | Open-source web application security scanner, used for identifying security vulnerabilities in a running web app. | Web Applications (HTTP, HTTPS)               | Open-source    |    

