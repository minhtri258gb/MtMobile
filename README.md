
# Install
- open pubspec.yaml > flutter packages get
- Choose chrome
- flutter run

* Hot reload: press "R" into terminal

* Build APK:
	> flutter build apk

* Update dependencies:
	> flutter pub get
	> flutter pub outdated

* Thêm thư viện
	> flutter pub add mobile_scanner
	> flutter pub add qr_code_scanner
	- hoặc
	- Mở file "pubspec.yaml"
	- Thêm dòng "mobile_scanner: ^4.0.0" dưới "dependencies" hoặc "dev_dependencies"
	- Chạy lệnh "flutter pub get"

* Xóa thư viện
	> flutter pub remove mobile_scanner

* Rename package name: flutter pub run <com.old.package.name>:main <com.new.package.name>

# TODO
flutter pub add geolocator
flutter pub remove latlong

Run offline: flutter run -d chrome --web-renderer html
