#!/bin/bash

git=$(sh /etc/profile; which git)
number_of_commits=$("$git" rev-list HEAD --count)
git_release_version=$("$git" describe --tags --always --abbrev=0)

echo $git_release_version

