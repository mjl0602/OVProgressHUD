# progresshud

一个好用的Hud框架，通过Flutter调用原生代码的方式实现，包含loading（默认），success，error，info等样式。通过一行代码即可在任何地方调出Hud，并控制其隐藏，在示例App中，你可以看到具体如何使用它。

在iOS上使用SVProgressHUD，安卓上使用SVProgressHUD-Android（这个包就是仿写的iOS版本）。ui均来自原生层，所以没有过多的可定义空间，如果需要自定义，可以分别在各个平台上重写框架代码（比较麻烦）。

A useful Hud framework is implemented by calling native code by Flutter. With one line of code, you can call Hud out anywhere and control its hiding. In the example App, you can see how to use it.
SVProgress HUD is used on iOS and SVProgress HUD-Android is used on Android (this package is a copy of iOS version). UI comes from the native layer, so there is not too much definition space. If you need to customize, you can rewrite the framework code on each platform separately (more troublesome).

EasyUse ProgressHUD for flutter app.

## Usage

```dart
Progresshud.show();
```

![Show](https://github.com/mjl0602/OVProgressHUD/blob/dev/ScreenShot/ios/Show.png)

```dart
Progresshud.showWithStatus('myinfo');
```

![Status](https://github.com/mjl0602/OVProgressHUD/blob/dev/ScreenShot/ios/Status.png)

```dart
Progresshud.showSuccessWithStatus('myinfo');
```

![Success](https://github.com/mjl0602/OVProgressHUD/blob/dev/ScreenShot/ios/Success.png)

```dart
Progresshud.showInfoWithStatus('myinfo');
```

![Info](https://github.com/mjl0602/OVProgressHUD/blob/dev/ScreenShot/ios/Info.png)

```dart
Progresshud.showErrorWithStatus('myinfo');
```

![Error](https://github.com/mjl0602/OVProgressHUD/blob/dev/ScreenShot/ios/Error.png)

```dart
Progresshud.setDefaultMaskTypeBlack();
```

![MaskTypeBlack](https://github.com/mjl0602/OVProgressHUD/blob/dev/ScreenShot/ios/MaskTypeBlack.png)

```dart
Progresshud.setDefaultMaskTypeGradient('myinfo');
```

![MaskTypeGradient](https://github.com/mjl0602/OVProgressHUD/blob/dev/ScreenShot/ios/MaskTypeGradient.png)


