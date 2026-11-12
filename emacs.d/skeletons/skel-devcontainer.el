(define-skeleton skel-dev-container
  "Devcontainer definitions file"
  \n
  > "{" \n
  > " \"containerEnv\": {" \n
  > "}," \n
  > "\"dockerComposeFile\":\"docker-compose.yml\"," \n
  > "\"features\": {" \n
  > "\"ghcr.io/devcontainers-community/features/direnv:1\": {}," \n
  > "\"ghcr.io/devcontainers/features/git:1\": {}," \n
  > "\"ghcr.io/stu-bell/devcontainer-features/cursor-cli:0\": {}" \n
  > "}," \n
  > "\"forwardPorts\": [" \n
  > "\"8000\"" \n
  > "]," \n
  > "\"mounts\": [" \n
  > "{" \n
  > "\"source\":\"${localEnv:USERPROFILE}${localEnv:HOME}/.ssh\"," \n
  > "\"target\":\"/tmp/host-ssh\"," \n
  > "\"type\":\"bind\"" \n
  > "}" \n
  > "]," \n
  > "\"postCreateCommand\": {" \n
  > "\"direnv\":\"echo 'eval \"$(direnv hook bash)\"' >> ~/.bashrc; echo \"dotenv .env.local\" > ${containerWorkspaceFolder}/.envrc; touch ${containerWorkspaceFolder}/.env.local; direnv allow ${containerWorkspaceFolder}\"," \n
  > "\"workspace\":\"sudo chown -R vscode:vscode /workspace\"" \n
  > "}," \n
  > "\"remoteUser\":\"vscode\"," \n
  > "\"service\":\"devcontainer\"," \n
  > "\"workspaceFolder\":\"/workspace\"" \n
  > "}" \n)

