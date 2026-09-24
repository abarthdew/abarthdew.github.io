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

## External Markdown Posts

Dated files in `_posts/` contain blog metadata and a source reference:

```yaml
external_repo: abarthdew/back-and-forth
external_path: 01-programming-languages/java/method-reference.md
external_branch: main
render_with_liquid: false
```

The build fetches the source body. Keep source documents as ordinary Markdown:
no Jekyll front matter, Liquid filters, or Chirpy attribute lists are needed.
Relative images resolve against the source document directory; relative links
open the source repository. Literal Vue templates and other code examples are
not evaluated as Liquid. Titles, categories, dates, and existing post URLs stay
in this repository.

Merge source-document pull requests **before** the blog pull request. Source
updates appear on the next blog build, not immediately: run the existing
`Deploy Jekyll site to Pages` workflow after later source-only changes. A source
fetch failure logs a warning and displays a warning on that post without
blocking the other posts. Review build logs for `External mirror:` warnings.

Run `bundle exec ruby tools/test_external_mirror.rb` for offline regression tests.
For a full build against checked-out source PRs, clone all source repositories
beside this checkout and run `bundle exec ruby tools/verify_mirror_build.rb ..`.
See [STUDY-10 inventory](tools/STUDY-10-mirroring.md) for all source mappings and
the migration's preservation checks.
