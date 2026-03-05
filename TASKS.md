# Manual Setup Tasks

## 1Password Secrets

- [ ] Create 1Password item `gha--github--n8agent-pat` in `heapsinfra` vault with a GitHub PAT that has `contents:write` and `packages:write` on this repo
- [ ] Ensure `OP_SERVICE_TOKEN` is set as a GitHub Actions secret on this repo

## GitHub Repo Settings

- [ ] Enable GitHub Actions on the repo
- [ ] Under Settings → Actions → General, allow GitHub Actions to create and approve pull requests
- [ ] Under Settings → Packages, ensure GHCR is enabled for the org

## Cloudflare (managed by nsheaps/iac)

- [ ] Worker deployment is handled by the `nsheaps/iac` repo — no manual Cloudflare setup needed here

## First Release

- [ ] Run the Release workflow manually (Actions → Release → Run workflow) with `patch` increment
- [ ] Verify the `v0.1.0` tag is created and GHCR image is published at `ghcr.io/nsheaps/cors-proxy:0.1.0`

## DNS (managed by nsheaps/iac)

- [ ] `private-pages.nsheaps.dev` and `cept.nsheaps.dev` CNAME records are managed by Pulumi in `nsheaps/iac`
