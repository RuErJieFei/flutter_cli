# flutter脚手架

1. 编码规范

   一定要看！！！

   [用法示例](https://dart.cn/guides/language/effective-dart/usage#dont-allow-an-import-path-to-reach-into-or-out-of-lib)
## 编码规范

1. 同文件夹类超过3个用 `index.dart` 暴露给外部 `import`
```dart
export 'app_channel.dart';
export 'log.dart';
export 'tools.dart';
export 'ui.dart';
export 'screen.dart';
export 'toast.dart';
```

2. 类如果太臃肿，且功能无法进一步拆分的话，使用 `mixins` 拆分

3. 对于比较复杂的 Dialog 创建`page`，然后使用 `UI.showPageDailog` 打开
```dart
UI.showPageDailog(
  routeName: Routes.LOGIN,
  titleText: '登录注册',
  onDispose: loginBindingDispose,
)
```

4 `initService` 代码规范
  - 不出现业务代码
  - 只包含 Service 类
  - 多 Service 如果有依赖关系，需要严格使用 `await` 控制。

```dart
Future initServices() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(Sentry()..init());
  await Get.putAsync(() => Connectivity().init());

  await Get.putAsync(() => SharedPrefereces().init());
  Get.put(DbService());
  await Get.putAsync(() => AppService().init());

  await Get.putAsync(() => Vibration().init());
}

2. 框架说明

   

3. 常量定义

4. 常用方法

5. 路由
## 路由

> 路由详细文档请参考 [getx 路由管理 文档](https://github.com/jonataslaw/getx/blob/master/documentation/zh_CN/route_management.md) 

#### 常用接口对应关系

​```dart
Navigator.push  => Get.to
Navigator.pushNamed => Get.toNamed
Navigator.pushReplacement => Get.off
Navigator.pushReplacementNamed => Get.offName
Navigator.pop => Get.back
Navigator.popUtil => Get.util
```

#### 获取当前路由

通过 `Get.routing` 可以后去当前界面的路由

有时候我们还想知道哪个 `dialog` 或者 `bottomSheet` 显示了。那可以通过 `AppMiddlewares.curRoute` 获取路由名字

> 弹出的 `dialog` 后者 `bottomSheet` 需要配置 `routeSettings`

#### 规范使用流程

1. 创建 page

```shell
get create page:settings
```

2. 跳转到 settings

```dart
Get.toNamed(Routes.SETTINGS);
```

> 如果像使用  dialog 或者 bottomsheet 弹出

3. `settings_bindings.dart` 文件内添加销毁 Controller 方法

```dart
settingsBindingDispose() {
  Get.delete<SettingsController>();
}
```

4. 使用 dialog 或者 bottomsheet 打开

```dart
UI.showPageDailog(
    routeName: Routes.SETTINGS,
    onDispose: settingsBindingDispose,
    willPop: false,
    title: SizedBox(),
    titleText: '',
    hasClose: false,
    elevation: 0,
    backgroundColor: Colors.transparent,
    arguments: null,
  );
}

MyUI.showPageBottomSheet(
  routeName: Routes.SETTINGS,
  onDispose: settingsBindingDispose,
  arguments: null,
);
```

6. 网络请求

7. 主题
# 暗黑和亮色主题

### 主题色配置

`app/themes/base.dart` 配置通用主题

```dart

final baseTheme = ({Brightness brightness = Brightness.light}) => ThemeData(
      brightness: brightness,
      primaryColor: Color(0xFF1ac0c6),
      // 去除 item 点击水波纹
      highlightColor: Color.fromRGBO(0, 0, 0, 0),
      splashColor: Color.fromRGBO(0, 0, 0, 0),
      iconTheme: IconThemeData(color: Colors.blue),
      errorColor: Colors.deepOrangeAccent,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: Color(0xFF0086DE),
      ),
    );

```

`app/themes/dark.dart` 配置暗黑主题

```dart
final darkTheme = baseTheme(brightness: Brightness.dark);
```

`app/themes/light.dart` 配置亮色主题

```dart
final lightTheme = baseTheme().copyWith(
  primaryColor: Color(0xFF1ac0c6),
  dividerColor: Colors.grey[200],
  dividerTheme: DividerThemeData(space: 1, thickness: 0.7),
  scaffoldBackgroundColor: Colors.grey[100],
  canvasColor: Colors.grey[100],
  cardColor: Colors.white,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.grey[100],
    textTheme: TextTheme(
      headline6: TextStyle(color: Colors.black),
    ),
    iconTheme: IconThemeData(color: Colors.black),
  ),
);
```

### 主题切换

```dart
final result = await UI.showSelectionBottomSheet(
    selections: ['跟随系统', '黑暗模式', '亮色模式']);
if (result is int) {
  if (result == 0) {
    // 切换为跟随系统
    S().appThemeMode = AppThemeMode.system;
    Get.changeTheme(window.platformBrightness == Brightness.light
        ? lightTheme
        : darkTheme);
  } else if (result == 1) {
    // 切换为暗黑主题
    S().appThemeMode = AppThemeMode.dark;
    Get.changeTheme(darkTheme);
  } else if (result == 2) {
    // 切换为亮色主题
    S().appThemeMode = AppThemeMode.light;
    Get.changeTheme(lightTheme);
  }
}
```

8. 国际化
### 国际化
#### 1. 在 `assets/locales` 文件夹下创建对应语言的国家化文本

en.json

```json
{
  "app": {
    "name": "Flutter CLI",
    "cancel": "Cancel"
  },
  "aphorism": {
    "1": "The roots of education are bitter , but the fruit is sweet .",
    "2": "Patience is bitter, but its fruit is sweet .",
    "3": "To sensible men, every day is a day of reckoning.",
    "4": "I have nothing to offer but blood , toil tears and sweat .",
    "5": "Never leave that until tomorrow , which you can do today ."
  },
  "locales": {
    "zh": "Chinese",
    "en": "English",
    "system": "System"
  }
}
```

zh.json

```json
{
  "app": {
    "name": "Flutter CLI",
    "cancel": "取消"
  },
  "aphorism": {
    "1": "教育的根是苦的，但其果实是甜的。",
    "2": "忍耐是痛苦的，但它的果实是甜蜜的。",
    "3": "对聪明人来说，每一天的时间都是要精打细算的。",
    "4": "我所能奉献的没有其它，只有热血、辛劳、眼泪与汗水。",
    "5": "今天的事不要拖到明天。"
  },
  "locales": {
    "zh": "简体中文",
    "en": "英语",
    "system": "跟随系统"
  }
}
```

#### 2. 生成代码

```shell
get generate locales assets/locales   
```

在 `generated` 目录下会生成 `locales.g.dart` 文件

```dart
// DO NOT EDIT. This is code generated via package:get_cli/get_cli.dart

// ignore_for_file: lines_longer_than_80_chars
// ignore: avoid_classes_with_only_static_members
class AppTranslation {
  static Map<String, Map<String, String>> translations = {
    'zh': Locales.zh,
    'en': Locales.en,
  };
}

class LocaleKeys {
  LocaleKeys._();
  static const app_name = 'app_name';
  static const app_cancel = 'app_cancel';
  static const aphorism_1 = 'aphorism_1';
  static const aphorism_2 = 'aphorism_2';
  static const aphorism_3 = 'aphorism_3';
  static const aphorism_4 = 'aphorism_4';
  static const aphorism_5 = 'aphorism_5';
  static const locales_zh = 'locales_zh';
  static const locales_en = 'locales_en';
  static const locales_system = 'locales_system';
}

class Locales {
  static const zh = {
    'app_name': 'Flutter CLI',
    'app_cancel': '取消',
    'aphorism_1': '教育的根是苦的，但其果实是甜的。',
    'aphorism_2': '忍耐是痛苦的，但它的果实是甜蜜的。',
    'aphorism_3': '对聪明人来说，每一天的时间都是要精打细算的。',
    'aphorism_4': '我所能奉献的没有其它，只有热血、辛劳、眼泪与汗水。',
    'aphorism_5': '今天的事不要拖到明天。',
    'locales_zh': '简体中文',
    'locales_en': '英语',
    'locales_system': '跟随系统',
  };
  static const en = {
    'app_name': 'Flutter CLI',
    'app_cancel': 'Cancel',
    'aphorism_1':
        'The roots of education are bitter , but the fruit is sweet .',
    'aphorism_2': 'Patience is bitter, but its fruit is sweet .',
    'aphorism_3': 'To sensible men, every day is a day of reckoning.',
    'aphorism_4': 'I have nothing to offer but blood , toil tears and sweat .',
    'aphorism_5': 'Never leave that until tomorrow , which you can do today .',
    'locales_zh': 'Chinese',
    'locales_en': 'English',
    'locales_system': 'System',
  };
}
```

#### 3. 在项目中使用

```dart
ListView(
  padding: EdgeInsets.all(20),
  children: [
    Text(LocaleKeys.aphorism_1.tr),
    Text(LocaleKeys.aphorism_2.tr),
    Text(LocaleKeys.aphorism_3.tr),
    Text(LocaleKeys.aphorism_4.tr),
    Text(LocaleKeys.aphorism_5.tr),
  ],
)
```

#### 4. 切换语言

```dart

void updateLocale(Locale? locale) {
  // 通过 Get 切换当前语言，传入空表示跟随系统
  Get.updateLocale(locale ?? window.locale);
  // 语言切换完成状态保存到本地
  if (locale != null) {
    S().languageCode = Get.locale!.languageCode;
  } else {
    S().languageCode = '';
  }
}
```

9. 常用三方库

   在·`yaml`文件中有详细的注释

10. 接入原生通道

11. GetX CLI使用说明

​                 https://github.com/jonataslaw/get_cli/blob/master/README-zh_CN.md 

11. GetX 插件使用说明

    https://github.com/kauemurakami/getx_snippets_extension

12. 

    
