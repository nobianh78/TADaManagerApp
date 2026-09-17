<<<<<<< HEAD
﻿# TADaManager (YouTube Mod & Patch Manager)

<div align="center">

# TADaManager
**Ứng dụng Android mã nguồn mở chuyên quản lý, mod và vá (patch) YouTube & YouTube Music**

Kế thừa kiến trúc hiện đại từ [Morphe Manager](https://github.com/MorpheApp/morphe-manager) và tham khảo giải pháp từ [ReVanced Manager](https://github.com/revanced/revanced-manager).

</div>

---

## 🌟 Giới thiệu (Overview)

**TADaManager** là giải pháp toàn diện giúp bạn mod trực tiếp các ứng dụng Android ngay trên thiết bị mà **không cần root**. TADaManager can thiệp ở tầng bytecode (smali & resources), loại bỏ toàn bộ quảng cáo, kích hoạt các tính năng cao cấp và trao lại quyền kiểm soát trải nghiệm ứng dụng cho bạn.

### ✨ Các tính năng vượt trội khi Mod YouTube với TADaManager:
- 🚫 **Chặn 100% quảng cáo**: Chặn quảng cáo video, quảng cáo xen ngang, quảng cáo trang chủ và đề xuất mua sắm.
- 🎵 **Phát trong nền (Background Playback)**: Nghe nhạc và video khi tắt màn hình hoặc chuyển sang ứng dụng khác.
- ⏭️ **SponsorBlock**: Tự động bỏ qua các đoạn quảng cáo tài trợ, intro, outro do YouTuber tự chèn vào video.
- 👎 **Return YouTube Dislike**: Khôi phục lại hiển thị số lượt Dislike công khai trên mọi video.
- 🖤 **AMOLED Pure Black Theme**: Giao diện màu đen tuyền tuyệt đối, tiết kiệm pin tối đa cho màn hình OLED/AMOLED.
- 👆 **Cử chỉ thông minh (Swipe Controls)**: Vuốt 2 bên màn hình để điều chỉnh âm lượng và độ sáng tiện lợi.
- 🩳 **Ẩn Shorts / Nút không cần thiết**: Ẩn mục Shorts hoặc các nút gây mất tập trung trên thanh điều hướng.
- 🔑 **Hỗ trợ GmsCore / MicroG**: Đăng nhập tài khoản Google an toàn, đồng bộ lịch sử và danh sách phát mà không bị chặn.

---

## 🎯 Chế độ Patch linh hoạt

1. **Simple Mode (Chế độ 1-chạm)**: 
   - Dành cho người dùng muốn cài đặt nhanh chóng. 
   - Tự động chọn cấu hình patch tối ưu nhất cho YouTube (chặn ads, phát nền, SponsorBlock, MicroG support) chỉ với 1 cú chạm.
2. **Expert Mode (Chế độ Chuyên sâu)**: 
   - Dành cho người dùng muốn toàn quyền kiểm soát. 
   - Tự do bật/tắt từng bản patch trong hơn 100+ bản patch, cấu hình thông số màu sắc, nút bấm, layout theo ý thích cá nhân.

---

## 📱 Hướng dẫn sử dụng TADaManager để Mod YouTube

### Bước 1: Chuẩn bị file YouTube APK gốc
1. Mở trình duyệt và truy cập [APKMirror](https://www.apkmirror.com/apk/google-inc/youtube/).
2. Tải phiên bản YouTube được khuyến nghị (chọn bản **APK dạng nodpi/universal**, không tải file Bundle nếu có bản APK đơn).

### Bước 2: Cài đặt dịch vụ GmsCore (để đăng nhập tài khoản Google)
- Trên thiết bị chưa root, cài đặt file **MicroG-RE / GmsCore** (TADaManager có sẵn đường dẫn tải 1-chạm trong phần cài đặt).

### Bước 3: Tiến hành Mod bằng TADaManager
1. Mở **TADaManager**.
2. Chọn ứng dụng **YouTube** (hoặc bấm nút **Bộ nhớ / Storage** để chọn file APK YouTube bạn vừa tải về ở Bước 1).
3. Chọn chế độ **Simple** (hoặc **Expert** nếu muốn chọn từng tính năng).
4. Bấm nút **Patch** và theo dõi quá trình vá trực tiếp trên màn hình.
5. Khi hoàn tất, bấm nút **Cài đặt (Install)** để cài đặt YouTube mod vào máy.
6. Thưởng thức YouTube không còn quảng cáo!

---

## 🛠️ Hướng dẫn Build APK TADaManager

### Cách 1: Tự động Build bằng GitHub Actions (Khuyên dùng)
Dự án đã được tích hợp sẵn quy trình CI/CD hoàn chỉnh trong `.github/workflows/build.yml`.
1. Fork hoặc Push mã nguồn lên kho lưu trữ GitHub của bạn.
2. Vào tab **Actions** -> Chọn workflow **Build TADaManager APK**.
3. Bấm nút **Run workflow** (chọn kiểu build `debug` hoặc `release`).
4. Sau vài phút, file APK cài đặt sẽ xuất hiện trong mục **Artifacts** để bạn tải về điện thoại ngay lập tức.

### Cách 2: Build trực tiếp trên máy tính cá nhân (Local Build)

**Yêu cầu môi trường:**
- **JDK 17** hoặc **JDK 21** (khuyên dùng Eclipse Temurin hoặc OpenJDK).
- **Android SDK** (API Level 34/35).

**Các lệnh build:**
```powershell
# Chạy script tự động trên Windows PowerShell
.\build.ps1 -BuildType debug

# Hoặc chạy trực tiếp với Gradle Wrapper
.\gradlew.bat assembleDebug -PsignAsDebug
```
File APK kết quả sẽ nằm tại: `app/build/outputs/apk/debug/TADaManager-debug.apk`.

---

## 🏗️ Kiến trúc kỹ thuật (Architecture)

- **Ngôn ngữ**: Kotlin 2.x
- **Giao diện người dùng**: Jetpack Compose kết hợp Material 3 & Dynamic Colors.
- **Tiến trình Patching cách ly**: AIDL IPC (`IPatcherProcess.aidl`) chạy trên tiến trình nền độc lập, đảm bảo an toàn bộ nhớ và ngăn chặn crash giao diện người dùng.
- **Xử lý gói APK**: Hỗ trợ split APKs (APKM, APKS, XAPK), tự động hợp nhất và ký chứng chỉ APK với keystore tích hợp.
- **Dependency Injection**: Koin.
- **Lưu trữ dữ liệu**: Room Database (quản lý bundles, installed apps, user preferences).
- **Đa ngôn ngữ**: Hỗ trợ tiếng Việt (`values-vi`, `values-vi-rVN`) và tiếng Anh (`values`).

---

## 📜 Giấy phép bản quyền (License)

Dự án được phân phối dưới giấy phép mã nguồn mở **GNU General Public License v3.0 (GPL-3.0)**. Xem chi tiết tại file [LICENSE](LICENSE).
=======
# TADaManagerApp
>>>>>>> a8a942751f9752d43a636afd763be11c29373f7d
