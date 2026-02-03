# Voice Discord Bot

Bot tự động tham gia voice và gửi lệnh playlist theo chu kỳ cho nhiều tài khoản Discord (selfbot).

## Yêu cầu

- Node.js 18+ (khuyến nghị LTS)
- Tài khoản Discord hợp lệ

## Cài đặt

```bash
npm install
```

## Cấu hình

Có 2 cách cấu hình:

1. Dùng một file `.env` ở thư mục gốc (nhanh gọn).
2. Dùng nhiều file trong `configs/` và chạy `run.bat` để chọn.

Tạo file mẫu:

```bash
copy configs\.env.example .env
```

Hoặc tạo file riêng:

```bash
copy configs\.env.example configs\account1.env
```

### Biến môi trường (theo từng tài khoản)

| Biến | Mô tả | Ví dụ |
| --- | --- | --- |
| `TOKEN` | Token Discord của tài khoản | `TOKEN=your_token` |
| `GUILD_ID` | ID server | `GUILD_ID=123` |
| `VOICE_CHANNEL_ID` | ID voice/text channel cần join + chat | `VOICE_CHANNEL_ID=456` |
| `SEND_CHAT` | Bật/tắt gửi chat (`true/false`, `on/off`, `1/0`) | `SEND_CHAT=ON` |
| `INTERVAL` | Chu kỳ gửi lệnh (ms hoặc biểu thức số) | `INTERVAL=11 * 60 * 60 * 1000` |
| `PLAYLIST` | Lệnh playlist để gửi | `PLAYLIST=m!p <playlist>` |
| `SELFDEAF` | Tự tắt loa | `SELFDEAF=false` |
| `SELFMUTE` | Tự tắt mic | `SELFMUTE=false` |

Lưu ý: Bot chỉ khởi chạy các account có đủ `TOKEN`, `GUILD_ID`, `VOICE_CHANNEL_ID`.

### Tùy chọn nâng cao (áp dụng chung)

| Biến | Mặc định | Ý nghĩa |
| --- | --- | --- |
| `VOICE_READY_TIMEOUT_MS` | `15000` | Thời gian chờ voice ready |
| `VOICE_RETRY_BASE_MS` | `5000` | Delay retry lần đầu |
| `VOICE_RETRY_MAX_MS` | `60000` | Delay retry tối đa |
| `VOICE_RETRY_JITTER_MS` | `1000` | Jitter để tránh spam |
| `VOICE_CONNECT_STAGGER_MS` | `2000` | Random delay khi join |

## Chạy bot

Dùng `.env` mặc định:

```bash
node index.js
```

Dùng file config cụ thể:

```bash
node index.js --env configs\account1.env
```

Hoặc chạy nhiều config bằng `run.bat`.

## Nhật ký

Log được ghi vào `bot_logs.txt`.

## Lưu ý an toàn

- Không chia sẻ TOKEN với bất kì ai.
- Tự chịu trách nhiệm khi dùng selfbot (có thể vi phạm điều khoản Discord).
