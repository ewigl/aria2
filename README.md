## Aria2 Windows 本地运行配置

- [基础设置](https://github.com/P3TERX/aria2.conf/blob/master/aria2.conf)

### 使用

- 需要新建 aria2.session 空文件。

- 开机自启: 创建 VBS 快捷方式并放到 `C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp`。或使用 Windows 任务计划程序。

- 按需修改涉及路径的配置: `dir`, `input-file`, `save-session`

### 目录结构

```
.
└── D:/Apps/aria2/
    ├── aria2.conf
    ├── aria2.session
    ├── aria2.vbs
    ├── aria2c.exe
    └── restart.bat
```
