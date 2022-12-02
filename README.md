# semantic-release

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
## Contents

- [Description](#description)
- [Usage](#usage)
  - [Requirements](#requirements)
  - [Optional](#optional)
  - [Github Action Example](#github-action-example)
  - [Gitlab Action Example](#gitlab-action-example)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

---
## Description

Docker image to run [semantic-release](https://github.com/semantic-release/semantic-release)

Which provides:
* automated changelogs
* automated semver
* automated github|gitlab releases

---

## Usage

### Requirements

* The following environment variables **must** to be set:
  * `GH_TOKEN` || `GL_TOKEN` - [Authenticate semantic-release](https://semantic-release.gitbook.io/semantic-release/usage/ci-configuration#authentication) with your repository
* The source repo which uses this image must define its own [release configuration](https://semantic-release.gitbook.io/semantic-release/usage/configuration#configuration-file)

----

### Optional

* The following environment variables can **optionally** be set:
  * Configure git profile for `semantic-release` - defaults to [semantic-release-bot](https://semantic-release.gitbook.io/semantic-release/usage/configuration#git-environment-variables)
    * `GIT_AUTHOR_NAME` - The author name associated with the Git release tag
    * `GIT_AUTHOR_EMAIL` - The email name associated with the Git release tag
    * `GIT_COMMITTER_NAME` - The committer name associated with the Git release tag
    * `GIT_COMMITTER_EMAIL` - The committer email associated with the Git release tag

<!-- The origin repository must define its own [release configuration](https://semantic-release.gitbook.io/semantic-release/usage/configuration#configuration-file)

  ```json
  // releaserc.json
  {
    "branches": ["main"],
    "plugins": [
      "@semantic-release/commit-analyzer",
      "@semantic-release/release-notes-generator",
      "@semantic-release/changelog",
      [
        "@semantic-release/git",
        {
          "assets": ["CHANGELOG.md"],
          "message": "chore(release): ${nextRelease.version} CHANGELOG.md"
        }
      ],
      "@semantic-release/gitlab"
    ]
  }
  ``` -->

---

### Github Action Example

TODO

<!-- This example job will run semantic release on the repositories default branch -->

<!-- TODO 
```yaml
```
 -->

 ### Gitlab Action Example

TODO

 <!-- This example job will run semantic release on the repositories default branch -->

<!-- TODO 
```yaml
```
 -->
