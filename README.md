## Aria2 Windows 本地运行配置

- [基础设置](https://github.com/P3TERX/aria2.conf/blob/master/aria2.conf)

### 使用

- 需要 [aria2c](https://github.com/aria2/aria2/releases)

- 需要 [AriaNG](https://github.com/mayswind/AriaNg/releases) 等控制台

- 需要新建 aria2.session 空文件

- 开机自启: 创建 VBS 快捷方式并放到 `C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp`

- 涉及路径的配置: `dir`, `input-file`, `save-session`

### 目录结构

```
.
└── D:/Apps/aria2/
    ├── aria2.conf
    ├── aria2.session
    ├── aria2.vbs
    ├── aria2c.exe
    ├── restart.bat
    └── updateTrackers.bat
```
