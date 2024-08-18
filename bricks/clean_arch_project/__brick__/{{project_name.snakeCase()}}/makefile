FLUTTER_CMD=fvm flutter
DART_CMD=fvm dart
# ANDROID_DIR=$(shell cd "$(dir $(lastword $(MAKEFILE_LIST)))" && cd ../android && pwd)
ANDROID_DIR="android"
FLAVOR_DEVELOPMENT_ARGS=--flavor development --target lib/main_development.dart --dart-define FLAVOR=development
FLAVOR_STAGING_ARGS=--flavor staging --target lib/main_staging.dart --dart-define FLAVOR=staging
FLAVOR_PRODUCTION_ARGS=--flavor production --target lib/main_production.dart --dart-define FLAVOR=production

.PHONY: menu build_development build_staging build_production clean pub_get

menu:
	@echo "Please select a target:"
	@echo "1) Build Development APK"
	@echo "2) Build Staging APK"
	@echo "3) Build Production APK"
	@echo "4) Clean Project"
	@echo "5) Run 'pub get'"
	@echo "6) Run build runner"
	@echo "7) Mason make feature"
	@echo "8) Dart Fix"
	@echo "Enter your choice:"
	@read choice; \
	if [ $$choice -eq 1 ]; then \
		$(MAKE) build_development; \
	elif [ $$choice -eq 2 ]; then \
		$(MAKE) build_staging; \
	elif [ $$choice -eq 3 ]; then \
		$(MAKE) build_production; \
	elif [ $$choice -eq 4 ]; then \
		$(MAKE) clean; \
	elif [ $$choice -eq 5 ]; then \
		$(MAKE) pub_get; \
	elif [ $$choice -eq 6 ]; then \
		$(MAKE) build_runner; \
	elif [ $$choice -eq 7 ]; then \
		$(MAKE) mason_feature; \
	elif [ $$choice -eq 8 ]; then \
		$(MAKE) dart_fix; \
	else \
		echo "Invalid choice."; \
	fi

build_development:
	$(FLUTTER_CMD) build apk $(FLAVOR_DEVELOPMENT_ARGS)

build_staging:
	$(FLUTTER_CMD) build apk $(FLAVOR_STAGING_ARGS)

build_production:
	$(FLUTTER_CMD) build apk $(FLAVOR_PRODUCTION_ARGS)

clean:
	$(FLUTTER_CMD) clean
	# cd $(ANDROID_DIR) && ./gradlew clean && cd ..

pub_get:
	$(FLUTTER_CMD) pub get

build_runner:
	${DART_CMD} pub run build_runner build -d

mason_feature:
	mason make feature -o ./lib/features

dart_fix:
	$(DART_CMD) fix --dry-run