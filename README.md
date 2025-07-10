# CV Repository with Overleaf Integration

This repository contains a LaTeX-based CV using the McDowell CV template with multiple Overleaf integration options.

## 🚀 Quick Start

### Download Latest PDF
- **Direct download**: [Latest CV PDF](https://nightly.link/ponich/cv/workflows/build-latex/main/cv-pdf.zip) (auto-updated)
- **From releases**: Check the [Releases page](../../releases) for tagged versions

### Local Compilation
```bash
./build-cv.sh
```

## 📝 Overleaf Integration Options

### Option 1: GitHub Synchronization (Premium Overleaf Users)

**Requirements**: Overleaf Premium subscription

1. **Link your GitHub account** to Overleaf in [Account Settings](https://www.overleaf.com/user/settings)
2. **Create new project from GitHub**:
   - In Overleaf, click "New Project" → "Import from GitHub"
   - Select this repository (`ponich/cv`)
3. **Sync workflow**:
   - Make changes in Overleaf
   - Push to GitHub: Menu → GitHub → "Push Overleaf changes to GitHub"
   - Pull from GitHub: Menu → GitHub → "Pull changes from GitHub"

**Benefits**: 
- Seamless two-way sync
- Collaborative editing in Overleaf
- Automatic PDF generation via GitHub Actions

### Option 2: Git Integration (Premium Overleaf Users)

**Requirements**: Overleaf Premium subscription

1. **Clone this repository locally**:
   ```bash
   git clone https://github.com/ponich/cv.git
   cd cv
   ```

2. **Add Overleaf as a remote**:
   ```bash
   git remote add overleaf https://git.overleaf.com/[YOUR_PROJECT_ID]
   ```

3. **Sync workflow**:
   ```bash
   # Pull latest from GitHub
   git pull origin main
   
   # Push to Overleaf
   git push overleaf main
   
   # Pull changes from Overleaf
   git pull overleaf main
   
   # Push back to GitHub
   git push origin main
   ```

### Option 3: Manual Upload (Free Overleaf Users)

**Requirements**: Free Overleaf account

1. **Download the repository**:
   - Click "Code" → "Download ZIP"
   - Extract the files

2. **Upload to Overleaf**:
   - Create a new blank project in Overleaf
   - Upload the files from `mcdowell-cv/` folder
   - Upload fonts from `fonts/` folder (if needed)

3. **Sync workflow**:
   - Download changes from Overleaf when needed
   - Upload new versions manually
   - Use GitHub Actions for automatic PDF generation

### Option 4: Fork & Watch (Automated Approach)

**For any Overleaf user level**

1. **Fork this repository**
2. **Set up Overleaf project** using any of the above methods with your fork
3. **Enable GitHub Actions** in your fork
4. **Watch for updates**: 
   - Star this repository to get notifications
   - Manually sync changes to your fork when updates are available

## 🔧 Technical Details

### Repository Structure
```
├── mcdowell-cv/           # Main LaTeX files
│   ├── cv.tex            # Main CV content
│   └── mcdowellcv.cls    # Document class
├── fonts/                # Custom fonts
├── .github/workflows/    # GitHub Actions
├── Dockerfile           # LaTeX build environment
└── build-cv.sh         # Local build script
```

### Build Process
- **GitHub Actions**: Automatically builds PDF on every push
- **Docker**: Consistent LaTeX environment using LuaLaTeX
- **Artifacts**: PDFs available for 90 days after each build
- **Releases**: Tagged versions include attached PDFs

### Overleaf Compatibility
- All LaTeX files are in the `mcdowell-cv/` directory
- Uses standard LaTeX packages available in Overleaf
- LuaLaTeX compiler recommended (supports custom fonts)
- No external dependencies or submodules

## 📋 Editing the CV

### Main Content File
Edit `mcdowell-cv/cv.tex` to update:
- Personal information (name, contact details)
- Work experience
- Skills and languages
- Education
- Achievements

### Custom Fonts
- Add `.ttf` files to the `fonts/` directory
- Fonts are automatically loaded in the Docker build
- For Overleaf: Upload fonts to your project manually

## 🚀 GitHub Actions Features

### Automatic PDF Generation
- Triggered on every push to main/master
- Uses Docker for consistent builds
- Uploads PDF as downloadable artifact

### Direct PDF Access
Get the latest PDF without browsing GitHub:
```
https://nightly.link/ponich/cv/workflows/build-latex/main/cv-pdf.zip
```

### Release Automation
- Create a git tag to trigger a release:
  ```bash
  git tag -a v1.0 -m "Version 1.0"
  git push --tags
  ```
- Automatically attaches PDF to the release

## 🤝 Contributing

1. Fork the repository
2. Make your changes in a feature branch
3. Test the build locally: `./build-cv.sh`
4. Create a pull request

## 📄 License

This project uses the McDowell CV template. Please check the original template's license for usage restrictions.

## 🆘 Troubleshooting

### Build Failures
- Check the GitHub Actions logs for detailed error messages
- Ensure all LaTeX syntax is valid
- Verify font files are properly formatted

### Overleaf Sync Issues
- **GitHub Sync**: Check repository permissions and OAuth settings
- **Git Integration**: Verify remote URLs and authentication
- **Manual Upload**: Ensure all file dependencies are included

### Font Issues
- For Docker builds: Add fonts to `fonts/` directory
- For Overleaf: Upload fonts manually to the project
- Use standard LaTeX fonts if custom fonts cause issues

## 📞 Support

- Create an issue for bug reports or feature requests
- Check existing issues for common problems and solutions
- For Overleaf-specific issues, consult [Overleaf Documentation](https://www.overleaf.com/learn)