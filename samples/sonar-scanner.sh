#!/bin/bash

sonar-scanner \
  -Dsonar.organization=xyz-workshops \
  -Dsonar.projectKey=git-secure-workshop \
  -Dsonar.sources=. \
  -Dsonar.host.url=https://sonarcloud.io
