# ios-app-motiondetector

モーションセンサーからデータを取得するサンプルアプリ。

* デバイスの向き (UIDeviceOrientationDidChangeNotification)
* シェイク (UIEventSubtypeMotionShake)
* Altimeter（高度計）
	* CMAltimeter
* Pedometer (歩数計)
	* CMPedometer
		* StepCounting
		* FloorCounting
		* Distance
* Accelerometer（加速度）
* Gyro（回転速度）
* Magnetometer（磁力）
* Device Motion (Processed Motion Data)
	* Gravity
	* User Acceleration
	* Rotation Rate
	* Magnetic Field
	* クオータニン
	* 回転行列
	* オイラー角