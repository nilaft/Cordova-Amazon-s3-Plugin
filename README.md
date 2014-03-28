Cordova-Amazon-s3-Plugin
========================

Amazon s3 file uploader  for Phonegap/Cordova

1) To config as3 
cordova.exec(successCallback,failCallback, "AS3Uploader","config", [ACCESS_ID, SECRET_KEY, BUCKET_NAME]);

2) To upload File
cordova.exec(successCallback,failCallback, "AS3Uploader","upload", [PATH]);
				where PATH is local file path


