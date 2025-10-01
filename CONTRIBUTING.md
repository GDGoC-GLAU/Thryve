# Contributing Guide 🚀

We ❤️ contributions!
This project is open-source and part of **Hacktoberfest**, so feel free to pick an issue and start contributing.

Whether it’s fixing a bug, adding a feature, improving docs, or writing tests — every contribution counts!

---

## 📌 How to Contribute

1. **Fork** this repo.
2. **Clone** your fork locally:

   ```bash
   git clone https://github.com/GDGoC-GLAU/Convoke.git
   cd convoke
   ```
3. **Create a branch** for your contribution:

   ```bash
   git checkout -b feature/your-feature-name
   ```
4. Make your changes:

   * Add new **screens** under `/lib/screens/`
   * Add new **widgets** under `/lib/widgets/`
   * Add or update **providers/services** under `/lib/providers/` or `/lib/services/`
   * Use helper methods/components from `/lib/utils/` where possible
   * Follow Flutter & Dart style guidelines (`flutter format .`)
5. **Run and test** your changes:

   ```bash
   flutter pub get
   flutter run
   ```
6. **Commit & Push**:

   ```bash
   git add .
   git commit -m "feat: add new meditation timer screen"
   git push origin feature/your-feature-name
   ```
7. Open a **Pull Request (PR)** against `main` with a clear description of your changes.

---

## 💡 What You Can Work On

* 🖼 **UI/UX**: Add new screens, improve existing widgets, animations, or theming.
* ⚙️ **Features**:

  * For **Thryve**: add motivational quote APIs, meditation timer enhancements, water reminder logic, health trackers.
* 🐞 **Bug Fixes**: Resolve open issues from GitHub Issues tab.
* 📖 **Documentation**: Improve README, add code comments, or write setup guides.
* 🧪 **Testing**: Write unit tests and widget tests (`flutter test`).

---

## 🏷 Labels

We use GitHub labels to help you find tasks:

* `good first issue` → beginner-friendly tasks
* `feature` → adding a new feature/screen/provider
* `bug` → fixing something broken
* `documentation` → improving docs, guides, or comments
* `enhancement` → UI/UX improvements or refactoring

---

## ✅ Code Style & Best Practices

* Follow **Dart Style Guide**: run

  ```bash
  flutter format .
  flutter analyze
  ```
* Use **meaningful commit messages**:

  * `feat: add water intake reminder`
  * `fix: crash on event registration page`
  * `docs: update contributing.md`
* Keep PRs **small and focused** (1 feature/bug per PR).

---

## 🙌 Community Guidelines

* Be respectful and collaborative.
* Ask questions in issues or discussions if you’re stuck.
* Help others by reviewing PRs.

---

## 🎉 Getting Started

To set up the project locally:

```bash
flutter pub get
flutter run
```

Make sure you have the latest **Flutter SDK** installed → [Flutter Install Guide](https://docs.flutter.dev/get-started/install).

✨ Thanks for contributing! Every PR makes this project better. Let’s build something amazing together 🚀
