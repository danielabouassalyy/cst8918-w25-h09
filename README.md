## Note to Instructor

Due to GitHub’s 100 MB file-size limit, this repository only includes the following files:

- `infra/main.tf` — Terraform configuration that provisions the AKS cluster  
- `sample-app.yaml` — Kubernetes manifest for the sample application  
- `.gitignore` — Excludes local Terraform plugin cache (`infra/.terraform/`), state files, and my `kubeconfig`

All other artifacts (Terraform provider binaries under `infra/.terraform/` and the generated `kubeconfig` file) were intentionally left out to avoid exceeding GitHub’s size limit. If you need those for testing, please let me know and I can provide them separately.

Thanks!  
– Daniel
