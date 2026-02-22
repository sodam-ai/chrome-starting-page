# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [1.0.0] - 2026-02-23

Major upgrade from the original [chrome-starting-page](https://github.com/sodam-AI/chrome-starting-page) project.

### Added

#### Search & Navigation
- Spotlight search (`Ctrl+F`) — unified search across bookmarks, todos, notes, and D-Days
- Korean initial consonant search (초성 검색: `ㅈㅁ` → "지메일")
- Keyword shortcuts for quick search (`yt`, `nv`, `gh`, `g`, `tw`, `map`)
- Command palette via `>` prefix in Spotlight (`todo`, `timer`, `edit`, `focus`)
- Full keyboard shortcut system (`/`, `S`, `E`, `T`, `Ctrl+K`, `Ctrl+F`, `1-9`)

#### Cards & Widgets
- **Habit card** — daily habit checklist tracker
- **Calendar card** — monthly/weekly views with event management
- **Multi-page system** — organize cards into separate pages with tab navigation
- Card collapse/expand with persistent state across sessions
- Card resizing (1x / 2x toggle in edit mode)
- Per-card custom background color
- Card drag-and-drop reordering via handle
- Add/remove cards with undo support

#### Bookmark Management
- Drag & drop URL from browser address bar to add bookmarks
- Drag & drop bookmarks between cards to move categories
- Drag & drop reordering within cards
- Duplicate URL detection and cleanup tool
- NEW badge on recently added bookmarks (auto-removes after 7 days)
- Undo support for bookmark deletion

#### Themes & Customization
- Dark / Light / Auto theme modes
- 8 accent color options
- Glass effect presets (Transparent / Default / Opaque) with adjustable transparency and blur
- Background options: solid color, image upload, slideshow
- Per-card color customization

#### Data & Backup
- Automatic backup with smart retention policy (7-day full → 30-day daily → auto-delete)
- Maximum 50 backup files with automatic cleanup
- Export to JSON, Markdown, and HTML report formats
- Drag & drop JSON import
- Trash / recycle bin for deleted items
- Profile management for multiple configurations
- Pomodoro timer statistics tracking

#### Infrastructure
- Service Worker caching for offline access (viewable even when server is down)
- 3-tier favicon fallback: Google → DuckDuckGo → auto-generated colored letter icons
- `restart.bat` for one-click server restart (Windows)
- Linux support with systemd service configuration
- New Tab Redirect extension guidance for new tab integration
- Save failure indicator (bottom-right "⚠ 저장 실패" warning)

#### Documentation
- Comprehensive troubleshooting guide (port conflict, server issues, display issues, data saving, icons)
- Complete uninstall guide for all platforms (Windows, macOS, Linux)
- Detailed project structure documentation
- Technical specifications section

### Changed
- **Todo system**: Removed 5-item-per-day limit → unlimited with priority levels, tags, due dates, and recurring tasks
- **Calendar**: Basic monthly view → full monthly/weekly calendar with event management
- **Search**: Simple engine switching → advanced multi-engine with keyword shortcuts and Spotlight
- **Settings**: Basic background URL input → comprehensive settings panel with theme, glass, background, weather, search, D-Day, and data management sections
- **Notepad**: Fixed 2 notepads → unlimited notepad cards, freely creatable
- **Favicon**: Google Favicon API only → 3-tier fallback system for reliability
- **Documentation**: 78 lines → 418 lines (5× more comprehensive)
- **Weather**: Not mentioned in original → weather widget with city name input
- **D-Day**: Not available → D-Day counter for important dates

### Improved
- Zero external npm dependencies — pure Node.js built-in modules only
- Vanilla JS + CSS with no framework overhead
- Low memory footprint (~15MB when idle)
- No system registry modifications, no global config files
- Server auto-start registration for Windows (Startup folder) and macOS (LaunchAgent)

---

## [Original] - Pre-fork

Original project by [sodam-AI](https://github.com/sodam-AI/chrome-starting-page)

### Features
- Glassmorphism UI design
- Multi-timezone global clocks
- Monthly calendar with basic todo (max 5 per day)
- Google / Naver / YouTube search switching
- 2 notepad widgets
- Background image via URL
- macOS / Windows auto-start setup
- Local server on port 1111
- Data protection via .gitignore
