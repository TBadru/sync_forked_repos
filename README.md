# GitHub Fork Mass Sync Script

A simple Bash script to mass-sync all your GitHub forks with their upstream repositories entirely server-side using the GitHub API.
No local cloning. No disk usage. Fast and repeatable.

---

## Features

* Syncs all forked repositories you own
* Uses GitHub’s native fork sync (server-side)
* No cloning or local git operations
* Safe to re-run anytime
* Works with public and private forks
* Syncs default branch only

---

## Requirements

* bash shell
* GitHub CLI (`gh`)
* jq
* Authenticated GitHub CLI session

### Install dependencies

**macOS**

```bash
brew install gh jq
```

**Ubuntu / Debian**

```bash
sudo apt install gh jq
```

**Fedora**

```bash
sudo dnf install gh jq
```


---

## Usage

### 1. Clone this repository

```bash
git clone https://github.com/TBadru/sync_forked_repos.git
cd sync_forked_repos
```

### 2. Authenticate with GitHub

```bash
gh auth login
```


### 3. Make the script executable

```bash
chmod +x sync_forked_repos.sh
```

### 4. Run the script

```bash
./sync_forked_repos.sh
```

That’s it. All your forks will be synced automatically.

---

## Important Notes

* Only the **default branch** of each fork is synced
* Uses `--force` to ensure forks exactly match upstream
* Any commits on your fork’s default branch **will be overwritten**
* Feature branches are **not affected**

---

## How It Works

1. Fetches all repositories you own
2. Filters only forked repositories
3. Uses `gh repo sync` to sync each fork with its upstream
4. Performs all operations **on GitHub**, not locally



---

## License

MIT License.

