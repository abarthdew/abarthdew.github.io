# abarthdew.github.io for ABarthDew

## Branch and deployment workflow

This repository deploys the GitHub Pages site through GitHub Actions only when
changes are pushed to the `master` branch.

- Use `work` as the day-to-day editing branch.
- Make web editor changes against `work`, not `master`, to avoid deploying every
  small edit.
- When a batch of changes is ready, open a pull request from `work` to `master`.
- Merging that pull request creates a push on `master`, which triggers the
  GitHub Pages deployment workflow.

### reference
- https://chirpy.cotes.page/
- https://chirpy.cotes.page/posts/text-and-typography/
- https://github.com/cotes2020/jekyll-theme-chirpy
