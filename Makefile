CARTHAGE_FRAMEWORKS=ls Carthage/Build/iOS/*.framework | grep "\.framework" | cut -d "/" -f 4 | cut -d "." -f 1 | xargs -I '{}'
CARTHAGE_ARCHIVES=ls PreBuiltFrameworks/*.zip | grep "\.zip" | cut -d "/" -f 2 | cut -d "." -f 1 | xargs -I '{}'

.DEFAULT_GOAL := help

install_carthage: ## install carthage frameworks
	carthage bootstrap --platform iOS --no-use-binaries

install: install_bundle install_carthage ## Install Gems, Carthage

carthage_clean: ## clean up all Carthage directories
	rm -rf Carthage

carthage_update: ## update carthage packages
	carthage update --platform iOS --no-use-binaries

carthage_archive: carthage_update ## update and archive carthage packages
	rm -rf PreBuiltFrameworks/*.zip
	$(CARTHAGE_FRAMEWORKS) carthage archive '{}' --output PreBuiltFrameworks/

carthage_track: carthage_archive ## track and commit carthage frameworks
	git lfs track PreBuiltFrameworks/*.zip
	git add .gitattributes
	git commit -m "Tracking Prebuilt Frameworks"
	git add PreBuiltFrameworks/*.zip
	git commit -m "Adding Prebuild Framworks"

carthage_extract: carthage_clean ## extract from carthage archives
	$(CARTHAGE_ARCHIVES) unzip PreBuiltFrameworks/'{}'.framework.zip

carthage_copy: ## copy carthage frameworks
	$(CARTHAGE_FRAMEWORKS) env SCRIPT_INPUT_FILE_0=Carthage/build/iOS/'{}'.framework SCRIPT_INPUT_FILE_COUNT=1 carthage copy-frameworks

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'