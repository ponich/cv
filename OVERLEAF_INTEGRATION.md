# Overleaf Integration Guide

This guide provides detailed instructions for integrating this CV repository with Overleaf using different approaches based on your subscription level and workflow preferences.

## 🎯 Choose Your Integration Method

### Method 1: GitHub Synchronization (Recommended for Premium Users)

**Best for**: Premium Overleaf users who want seamless two-way sync
**Requirements**: Overleaf Premium subscription

#### Step-by-Step Setup:

1. **Connect GitHub to Overleaf**
   - Go to your [Overleaf Account Settings](https://www.overleaf.com/user/settings)
   - Click "Link to your GitHub account"
   - Authorize Overleaf to access your repositories

2. **Import Repository to Overleaf**
   - In Overleaf, click "New Project"
   - Select "Import from GitHub"
   - Choose `ponich/cv` from the repository list
   - Wait for the import to complete

3. **Daily Workflow**
   ```
   In Overleaf:
   1. Menu → GitHub → "Pull changes from GitHub" (before editing)
   2. Make your changes in Overleaf
   3. Menu → GitHub → "Push Overleaf changes to GitHub" (after editing)
   ```

4. **Verification**
   - Changes pushed from Overleaf appear as commits by your GitHub username
   - GitHub Actions automatically builds PDF on every push
   - Download latest PDF from GitHub Actions artifacts

### Method 2: Git Integration (Advanced Users)

**Best for**: Premium users comfortable with Git command line
**Requirements**: Overleaf Premium subscription, Git installed locally

#### Step-by-Step Setup:

1. **Clone Repository Locally**
   ```bash
   git clone https://github.com/ponich/cv.git
   cd cv
   ```

2. **Create Overleaf Project**
   - In Overleaf, create a new blank project
   - Note the project URL: `https://www.overleaf.com/project/[PROJECT_ID]`

3. **Add Overleaf as Git Remote**
   ```bash
   # Replace [PROJECT_ID] with your actual project ID
   git remote add overleaf https://git.overleaf.com/[PROJECT_ID]
   ```

4. **Initial Sync to Overleaf**
   ```bash
   git push overleaf main
   ```

5. **Daily Workflow**
   ```bash
   # Start of work session
   git pull origin main          # Get latest from GitHub
   git pull overleaf main        # Get latest from Overleaf
   
   # After making changes (either locally or in Overleaf)
   git add .
   git commit -m "Update CV content"
   git push overleaf main        # Push to Overleaf
   git push origin main          # Push to GitHub
   ```

### Method 3: Manual Sync (Free Users)

**Best for**: Free Overleaf users or occasional editors
**Requirements**: Free Overleaf account

#### Step-by-Step Setup:

1. **Download Repository**
   - Go to https://github.com/ponich/cv
   - Click "Code" → "Download ZIP"
   - Extract the zip file

2. **Create Overleaf Project**
   - In Overleaf, click "New Project" → "Blank Project"
   - Name it "CV" or similar

3. **Upload Files**
   - Upload all files from `mcdowell-cv/` folder to your Overleaf project
   - Upload custom fonts from `fonts/` folder if needed
   - Set `cv.tex` as the main document

4. **Sync Workflow**
   ```
   To get updates:
   1. Download latest ZIP from GitHub
   2. Replace files in Overleaf manually
   
   To share changes:
   1. Download your project from Overleaf
   2. Create pull request on GitHub
   ```

### Method 4: Fork-Based Workflow

**Best for**: Users who want to maintain their own version
**Requirements**: GitHub account (any Overleaf subscription level)

#### Step-by-Step Setup:

1. **Fork the Repository**
   - Go to https://github.com/ponich/cv
   - Click "Fork" button
   - Fork to your GitHub account

2. **Set Up Overleaf Integration**
   - Use Method 1, 2, or 3 with your forked repository
   - Replace `ponich/cv` with `YOUR_USERNAME/cv` in all instructions

3. **Stay Updated**
   - Watch the original repository for updates
   - Sync changes from upstream when needed:
   ```bash
   git remote add upstream https://github.com/ponich/cv.git
   git fetch upstream
   git merge upstream/main
   ```

## 🔧 Configuration & Customization

### Setting Main Document in Overleaf

1. **Using GitHub Sync**: The main document is automatically detected as `cv.tex`
2. **Manual Upload**: After uploading, go to Menu → Settings → set "Main document" to `cv.tex`

### Compiler Settings

1. In Overleaf Menu → Settings:
   - **Compiler**: LuaLaTeX (recommended for custom fonts)
   - **TeX Live version**: 2023 or latest
   - **Auto Compile**: On (for faster editing)

### Custom Fonts Setup

#### In Overleaf:
1. Upload `.ttf` files from the `fonts/` directory to your project
2. The LaTeX document will automatically use them with LuaLaTeX

#### Troubleshooting Fonts:
- If fonts don't work, switch to PDFLaTeX and remove font references
- Use standard LaTeX fonts as fallback

## 🚨 Common Issues & Solutions

### GitHub Sync Problems

**Issue**: "Failed to push to GitHub"
- **Solution**: Check repository permissions in GitHub settings
- **Solution**: Ensure you have write access to the repository

**Issue**: "Merge conflicts detected"
- **Solution**: In Overleaf, Menu → GitHub → resolve conflicts manually
- **Solution**: Or resolve locally using Git and push resolved version

### Git Integration Problems

**Issue**: Authentication failures
- **Solution**: Use GitHub username and password (or token)
- **Solution**: Set up Git credentials caching:
  ```bash
  git config --global credential.helper cache
  ```

**Issue**: "Repository not found"
- **Solution**: Verify the Overleaf project URL and Git remote URL
- **Solution**: Check that you have access to both repositories

### Compilation Problems

**Issue**: "Package not found" errors
- **Solution**: Use only packages available in Overleaf (check [Package List](https://www.overleaf.com/learn/latex/LaTeX_package_documentation))
- **Solution**: Remove problematic packages and use alternatives

**Issue**: Font errors
- **Solution**: Switch from LuaLaTeX to PDFLaTeX
- **Solution**: Remove custom font declarations

## 📈 Advanced Workflows

### Team Collaboration

1. **Using GitHub Sync**:
   - Share Overleaf project with team members
   - Everyone can push/pull via GitHub
   - Use GitHub Issues for feedback and changes

2. **Using Git Integration**:
   - Multiple people can work locally
   - Use Git branches for different versions
   - Merge changes through pull requests

### Automated PDF Distribution

1. **Direct Links**:
   ```
   Latest PDF: https://nightly.link/ponich/cv/workflows/build-latex/main/cv-pdf.zip
   ```

2. **Release Management**:
   ```bash
   # Create versioned release
   git tag -a v2.0 -m "Updated CV for 2024"
   git push --tags
   ```

3. **Integration with Portfolio Websites**:
   - Use GitHub Pages to host CV
   - Link to latest PDF from your website
   - Embed PDF viewer in portfolio

## 🎓 Best Practices

### File Organization
- Keep all LaTeX files in `mcdowell-cv/` directory
- Use meaningful commit messages
- Regular sync between platforms (daily recommended)

### Version Control
- Tag important versions (job applications, major updates)
- Use branches for experimental changes
- Keep backup copies of important versions

### Security & Privacy
- Never commit sensitive information
- Use environment variables for personal data if needed
- Consider private repositories for personal CVs

## 📞 Getting Help

### Overleaf Support
- [Overleaf Documentation](https://www.overleaf.com/learn)
- [GitHub Sync Help](https://www.overleaf.com/learn/how-to/GitHub_Synchronization)
- [Git Integration Guide](https://www.overleaf.com/learn/how-to/Git_integration)

### Repository Issues
- Create an issue in the [GitHub repository](https://github.com/ponich/cv/issues)
- Check existing issues for solutions
- Include error messages and steps to reproduce

### Community Resources
- [LaTeX Stack Exchange](https://tex.stackexchange.com/)
- [Overleaf Webinars](https://www.overleaf.com/events/webinars)
- [Git Documentation](https://git-scm.com/doc)