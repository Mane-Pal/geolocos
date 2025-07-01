#!/bin/bash
# Install cloud and Kubernetes development tools

set -e

echo "Installing cloud and Kubernetes tools..."

# Core Kubernetes tools
yay -S --noconfirm --needed \
  kubectl \
  k9s \
  helm \
  kubectx \
  kustomize \
  stern

# Cloud provider CLIs
yay -S --noconfirm --needed \
  aws-cli-v2

# Infrastructure as Code
yay -S --noconfirm --needed \
  terraform

# Container and image tools
yay -S --noconfirm --needed \
  podman \
  dive \
  hadolint-bin \
  trivy

# Additional useful tools
yay -S --noconfirm --needed \
  jq \
  yq \
  httpie \
  curlie

echo "Cloud tools installation completed!"
echo ""
echo "Installed tools:"
echo "  • kubectl - Kubernetes CLI"
echo "  • k9s - Terminal Kubernetes dashboard"
echo "  • helm - Kubernetes package manager"
echo "  • kubectx/kubens - Context/namespace switching"
echo "  • kustomize - Kubernetes configuration management"
echo "  • stern - Multi-pod log tailing"
echo "  • aws-cli-v2 - AWS command line interface"
echo "  • terraform - Infrastructure as code"
echo "  • dive - Docker image layer analyzer"
echo "  • hadolint - Dockerfile linter"
echo "  • trivy - Container security scanner"
echo "  • jq/yq - JSON/YAML processors"
echo "  • httpie/curlie - HTTP clients"
echo ""
echo "Next steps:"
echo "  • Configure AWS CLI: aws configure"
echo "  • Configure kubectl: kubectl config set-context"
echo "  • Install Google Cloud auth: gcloud auth login"

