# Portfolio Cá Nhân Flutter

Một portfolio cá nhân được xây dựng bằng Flutter với giao diện hiện đại và hiệu ứng đẹp mắt.

## Tính năng

- **Giao diện hiện đại**: Thiết kế đẹp mắt với bảng màu hài hòa và thẩm mỹ
- **Hiệu ứng đẹp**: Animations mượt mà khi chuyển đổi và khi tương tác
- **Responsive**: Hoạt động tốt trên nhiều kích thước màn hình
- **Sections**:
  - Thông tin cá nhân
  - Kỹ năng
  - Dự án
  - Liên hệ

## Cài đặt

1. Đảm bảo Flutter đã được cài đặt trên máy tính của bạn
2. Clone repository này
3. Chạy lệnh sau để cài đặt dependencies:

```bash
flutter pub get
```

4. Chạy ứng dụng:

```bash
flutter run -d chrome
```

## Dependencies

Portfolio này sử dụng các thư viện sau:

- flutter_animate: Tạo các hiệu ứng animations
- flutter_staggered_animations: Tạo hiệu ứng staggered
- url_launcher: Mở link và download file
- google_fonts: Sử dụng Google Fonts
- shimmer: Tạo hiệu ứng shimmer loading
- lottie: Animations phức tạp

## Cấu trúc project

```
lib/
├── items/         # Data models và dữ liệu static
├── pages/         # Màn hình chính
├── styles/        # Colors, themes và styles
├── widgets/       # UI components
└── main.dart      # Entry point
```

## Tùy chỉnh

Bạn có thể tùy chỉnh portfolio bằng cách:

1. Thay đổi thông tin cá nhân trong các files trong thư mục `items/`
2. Thay đổi hình ảnh trong thư mục `assets/images/`
3. Điều chỉnh màu sắc trong `lib/styles/color.dart`

## Screenshots

![Screenshot 1](assets/images/screenshot1.png)
![Screenshot 2](assets/images/screenshot2.png)

## License

MIT License
