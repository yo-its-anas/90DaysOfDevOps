# Git Advanced Challenge Solutions

## Task 1: Pull Requests

### Steps to create a PR:
1. Fork the repository on GitHub
2. Clone locally: `git clone <your-forked-repo-url>`
3. Create feature branch: `git checkout -b feature-branch`
4. Make changes and commit: `git add . && git commit -m "message"`
5. Push to origin: `git push origin feature-branch`
6. Open PR on GitHub from your fork to original repo

### PR Description Best Practices:
- Clear, descriptive title
- Reference related issues (#123)
- Summary of changes
- Testing steps
- Screenshots for UI changes

### Handling Review Comments:
- Address all feedback
- Push updates to same branch
- PR updates automatically
- Mark comments as resolved

---

## Task 2: Reset vs Revert

### Differences:
- **Reset**: Rewrites commit history (dangerous for shared branches)
- **Revert**: Creates new undo commit (safe for shared branches)

### When to use:
- `reset --soft`: Undo commit but keep changes staged
- `reset --mixed`: Undo commit, unstage changes (default)
- `reset --hard`: Completely remove commit and changes
- `revert`: Safe option for public/shared branches

---

## Task 3: Stashing

### When to use:
- Switching branches with uncommitted work
- Saving incomplete work temporarily
- Pulling updates without committing

### Key Commands:
- Save: `git stash` or `git stash push -m "message"`
- Apply and keep: `git stash apply`
- Apply and remove: `git stash pop`
- List: `git stash list`
- Clear: `git stash clear`

### pop vs apply:
- `pop`: Apply and remove from stash list
- `apply`: Apply but keep in stash list

---

## Task 4: Cherry-Picking

### Use Cases:
- Applying bug fixes to multiple branches
- Selective commit migration
- Backporting features

### Process:
1. Find commit: `git log --oneline`
2. Cherry-pick: `git cherry-pick <commit-hash>`
3. Resolve conflicts if any
4. Continue: `git cherry-pick --continue`

### Risks:
- Duplicate commits in different branches
- Potential conflicts
- Loss of commit context

---

## Task 5: Rebasing

### Rebase vs Merge:
- **Merge**: Preserves history, creates merge commits
- **Rebase**: Linear history, rewrites commits

### Best Practices:
- Only rebase local branches
- Never rebase shared/public branches
- Use interactive rebase to clean history: `git rebase -i HEAD~3`

### Rebasing Process:
1. Fetch updates: `git fetch origin main`
2. Rebase: `git rebase origin/main`
3. Resolve conflicts
4. Continue: `git rebase --continue`

---

## Task 6: Branching Strategies

### Best for DevOps/CI/CD:
- **GitHub Flow**: Simple, main branch always deployable
- **Trunk-Based Development**: Short-lived branches, continuous integration

### Workflow Comparison:

#### Git Flow:
- Pros: Structured, good for versioned releases
- Cons: Complex, many long-running branches

#### GitHub Flow:
- Pros: Simple, fast deployments, good for CI/CD
- Cons: Less structure for versioning

#### Trunk-Based Development:
- Pros: Fast feedback, continuous delivery
- Cons: Requires strong testing culture

### Recommendation:
For DevOps pipelines, prefer **GitHub Flow** or **Trunk-Based Development** for faster feedback and continuous delivery.
