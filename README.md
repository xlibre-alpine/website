# X11Libre Alpine Linux/Chimera Linux Package Website

This is the official website for the X11Libre Alpine Linux/Chimera Linux package, hosted on GitHub Pages which also contains prebuilt packages (x86_64 for now).

## About

This website explains our independent approach to providing the X11Libre package for Alpine Linux/Chimera Linux users, bypassing the need for official repository inclusion.

## Features

- **Independent Philosophy**: Explains why we maintain our own repository
- **Clear Installation Instructions**: Step-by-step guide for adding our third-party repository
- **Multiple Installation Methods**: Various ways to install X11Libre
- **Community Support**: Links to GitHub issues, discussions, and documentation
- **Responsive Design**: Works on desktop and mobile devices

## GitHub Pages Setup

This website is designed to work with GitHub Pages. To deploy:

1. Push this repository to GitHub
2. Enable GitHub Pages in repository settings
3. Select the main branch as the source
4. The website will be available at `https://yourusername.github.io/xlibre-alpine-website`

## Customization

### Repository URLs

Update the following URLs in `index.html` to match your actual repository:

- `https://xlibre-alpine.github.io/main/xlibre.rsa.pub`
- `https://xlibre-alpine.github.io/main`
- `https://github.com/xlibre-alpine/apk/issues`
- `https://github.com/xlibre-alpine/apk/discussions`
- `https://github.com/xlibre-alpine/apk/wiki`

### Styling

The website uses a clean, modern design with:
- Gradient header with Alpine Linux branding
- Card-based layout for different sections
- Syntax highlighting for code blocks
- Responsive design for mobile devices
- Hover effects and smooth transitions

### Content

The website includes:
- Hero section explaining the independent approach
- Philosophy section with key benefits
- Detailed installation instructions
- Alternative installation methods
- Community support links
- Reasons for going independent

## File Structure

```
/
├── index.html          # Main HTML file
├── styles.css          # CSS styling
└── README.md           # This file
```

## License

This website is open source under the MIT license. Feel free to use and modify for your own Alpine Linux packages.

The XLibre logos in the [resources](resources) were obtained from this GitHub issue: https://github.com/X11Libre/xserver/issues/112#issuecomment-3053234708, which is based off the original logo at https://en.wikipedia.org/wiki/File:X.Org_Logo.svg that is licensed under the [Creative Commons Attribution-Share Alike 3.0 Unported](https://creativecommons.org/licenses/by-sa/3.0/deed.en) license.
