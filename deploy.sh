#!/bin/bash

echo "Begin deploy of the Mozilla Change Integration Service version 2."

if [[ "branch/master" == "$CODEBUILD_WEBHOOK_TRIGGER" ]]
	then
		echo "Deploying the development environment."
		make build-development
		make release-development
elif [[ "$CODEBUILD_WEBHOOK_TRIGGER" =~ ^tag\/[0-9]\.[0-9]\.[0-9](\-(pre|testing))?$ ]]
	then
		echo "Deploying the testing environment."
		make build-testing
		make release-testing
elif [[ "$CODEBUILD_WEBHOOK_TRIGGER" =~ ^tag\/[0-9]\.[0-9]\.[0-9](\-(prod))?$ ]]
	then
		echo "Deploying the production environment."
		make build-production
		make release-production
fi

echo "End deploy of the Mozilla Change Integration Service version 2."