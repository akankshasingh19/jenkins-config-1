#!/bin/bash
#
# Update global configuration files in Jenkins from Git repo
#
# Copy
#   $WORKSPACE/config/* $JENKINS_HOME
#
# TODO:
#   log diffs
#   jenkins reload or restart
#   config.xml
#   - views handled by DSL
#   - How to handle other things in non-Puppet env? XML editing
#   Build jenkins.model.JenkinsLocationConfiguration.xml file
#   Add another directory for templates that get transformed before putting on master?
#
if [ -d "${JENKINS_HOME}" ]; then
  # Jenkins master
  # TODO: log diffs, set flag if something changed
  echo "INFO: Copying config files..."
  cp -afu ${WORKSPACE}/config/* ${JENKINS_HOME}
  if [ -f etc/jenkins/plugins.list ]; then
    echo "INFO: Installing plugins... (TODO)"
    # TODO: set flag if something changed
  fi
  # TODO: tell Jenkins to reload config or restart
  # ${JENKINS_URL}
  # restart if plugin installed
  # reload if only config changed
else
  echo "ERROR: This can only run under Jenkins on the master!"
  exit 1
fi
