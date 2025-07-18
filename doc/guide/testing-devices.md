# Testing Devices

動作確認で使用するデバイスを優先順位順に設定します。

## Test Device Priority

| Priority | Platform | Device ID | OS Version | Type | Name |
|----------|----------|-----------|------------|------|------|
| 1 | Android | `emulator-5554` | 14 | Emulator | sdk gphone64 arm64 |
| 2 | iOS | `A1B2C3D4-E5F6-7890-ABCD-EF1234567890` | 17.0 | Emulator | iPhone SE (3rd generation) |

## Usage

```bash
# デバイス確認
fvm flutter devices

# 動作確認コマンド例（最優先デバイス使用）
fvm flutter run --flavor dev --dart-define-from-file=dart_defines/dev.env -d "A1B2C3D4-E5F6-7890-ABCD-EF1234567890"
```

## 設定方法

1. `fvm flutter devices` でデバイス一覧を確認
2. 表の **Device ID** 列に `flutter devices` 出力の正確なIDを設定
3. **Name** 列には `flutter devices` 出力の名前をそのまま使用
