# Contributing to EoStudio

Thank you for your interest in contributing to **EoStudio** — the world's most powerful universal development platform!

We welcome contributions of all kinds: bug fixes, new features, documentation, tests, plugins, and feedback. This document provides guidelines to make contributing as smooth and efficient as possible.

---

## Code of Conduct

We expect all contributors to adhere to our Code of Conduct (detailed in `CODE_OF_CONDUCT.md`). Please be respectful, inclusive, and professional in all communications.

---

## How Can I Contribute?

### 1. Reporting Bugs
- Search existing issues to ensure the bug hasn't been reported yet.
- Open a new issue with a clear, descriptive title.
- Include detailed steps to reproduce the issue, expected vs. actual behavior, and system details (OS, Python version, EoStudio version).
- Attach logs, screenshots, or stack traces if applicable.

### 2. Suggesting Enhancements
- Check existing feature requests.
- Open a new issue explaining the proposed feature, why it is useful, and how it should work.
- Provide wireframes, mockups, or examples of similar features in other tools if possible.

### 3. Submitting Pull Requests
- Fork the repository and create a new branch from `master` (e.g., `feat/my-awesome-feature` or `fix/issue-123`).
- Write clean, documented, and well-tested code following our style guide.
- Run the full test suite before submitting:
  ```bash
  python3 -m pytest tests/ -v
  ```
- Open a Pull Request (PR) with a clear title and a comprehensive description of your changes.
- Ensure your PR passes all CI/CD checks.

---

## Development Setup

To set up a local development environment:

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/embeddedos-org/EoStudio.git
   cd EoStudio
   ```

2. **Create a Virtual Environment**:
   ```bash
   python3 -m venv .venv
   source .venv/bin/activate  # On Windows: .venv\Scripts\activate
   ```

3. **Install Dependencies (Editable Mode)**:
   ```bash
   pip install -e ".[dev]"
   ```

4. **Verify Installation**:
   ```bash
   eostudio --help
   ```

---

## Coding Style & Standards

- **Language**: Python 3.11+
- **Style Guide**: We strictly follow [PEP 8](https://peps.python.org/pep-0008/). Use `black` for formatting and `flake8` for linting.
- **Type Hints**: All new code MUST include PEP 484 type hints.
- **Docstrings**: Use Google-style docstrings for all modules, classes, and public functions.
- **Imports**: Organize imports with `isort`. Group standard library, third-party, and local imports clearly.

---

## Testing Guidelines

- Every new feature or bug fix MUST be accompanied by unit or integration tests.
- We use `pytest` as our testing framework.
- Tests should be placed in the `tests/` directory and match the structure of the `eostudio/` source directory.
- Aim for **100% test pass rate** and **>90% code coverage** for all new modules.

---

## Plugin Development

EoStudio features an incredibly powerful plugin system. To create a new plugin:
1. Review the `eostudio/plugins/base.py` module to understand the plugin interface.
2. Check the `plugins/marketplace.py` catalog to see existing plugins.
3. Submit your plugin to the marketplace by opening a PR updating the catalog.

---

## Community & Support

- **Discord**: Join our developer community on [Discord](https://discord.gg/eostudio) to chat, ask questions, and collaborate.
- **Discussions**: Use GitHub Discussions for Q&A, design proposals, and general chat.
- **Help**: For billing, credits, or official technical support, please submit a request at [https://help.manus.im](https://help.manus.im).

Thank you for making EoStudio the absolute best tool for developers worldwide! 🚀
