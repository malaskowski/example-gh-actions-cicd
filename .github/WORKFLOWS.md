# Worflows

### Continuous Integration (CI)
- `CI: Checks` (`ci-checks.yml`) workflow is triggered on every push to the `main` branch as well on every Pull Request change. It and automates the process of checking the code quality and running unit tests for the applications.

### Continous Delivery (CD)

- **Stage: release and deploy** (`cd-stage-release-and-deploy.yml`) workflow automates the process of creating a new tag, building and pushing Docker images for the webapp and API server, and deploying these images to the development and staging environments. It also includes a step to destroy the development environment after deployment. Each job in the workflow depends on the successful completion of previous jobs, ensuring a sequential execution.
- **Stage: rollback** (`cd-stage-rollback.yml`) workflow automates the process of rolling back the deployment to the previous version.

### Ephimeral Environments
- **Ephemeral: deploy EKS environment** (`ephemeral-deploy-env.yml`) workflow is triggered manually and automates the deployment of an EKS environment. It builds Docker images for the webapp and API server using the `build-and-push.yml` workflow, calculates a namespace based on the branch name, and then deploys these images to the development environment using the `deploy-and-test.yml` workflow. Each step depends on the successful completion of the previous steps, ensuring a sequential execution.
- **Ephemeral: destroy EKS environment** (`ephemeral-destroy-env.yml`) workflow is triggered manually and automates the destruction of an EKS environment. It destroys the development environment and the namespace associated with the branch name.