# DeepGuard

**Offline image forensics and deepfake detection from your terminal**

![Python 3.10+](https://img.shields.io/badge/python-3.10+-blue)
![PyTorch](https://img.shields.io/badge/PyTorch-2.0+-red)
![OpenCV](https://img.shields.io/badge/OpenCV-4.8+-green)
![License MIT](https://img.shields.io/badge/license-MIT-blue)

Every digital manipulation leaves a trace. DeepGuard finds it. Run forensic analysis on any image or document directly from your terminal — offline, no API keys, no cloud. Get a visual HTML report with confidence scores in seconds.

## Features

- **Error Level Analysis (ELA)** - Detects compression inconsistencies from image editing
- **Noise Pattern Analysis** - Identifies statistically anomalous noise regions
- **EXIF/Metadata Forensics** - Extracts camera data, timestamps, and software history
- **Copy-Move Clone Detection** - Finds duplicated regions within images using DCT matching
- **Face Consistency Check** - Analyzes facial regions for deepfake indicators (eye reflections, skin texture, edge blending)
- **Compression Artifact Mapping** - Visualizes JPEG compression block artifacts
- **Visual HTML Report** - Beautiful dark-themed forensic report with heatmaps and confidence scores
- **Batch Processing** - Analyze entire folders at once
- **JSON Export** - Machine-readable results for automation
- **100% Offline** - Works completely offline, no external APIs or cloud services required

## Supported Formats

JPEG, PNG, TIFF, BMP, WebP, PDF (first page)

## Quick Start

Install from PyPI:
```bash
pip install deepguard
```

Analyze an image:
```bash
deepguard analyze photo.jpg
```

This generates a detailed forensic report and opens it in your browser.

## Commands

### Analyze a single file
```bash
deepguard analyze <file> [--output report.html] [--confidence 0.75]
```
Runs all forensic techniques and generates an HTML report with a final verdict (AUTHENTIC, SUSPICIOUS, or MANIPULATED).

### Batch process a folder
```bash
deepguard batch <folder> [--output results.json] [--recursive]
```
Analyzes all supported images in a folder and exports results to JSON.

### Generate a forensic report
```bash
deepguard report <file> --format html [--output report.html]
```
Creates a detailed visual HTML forensic report with heatmaps and technique breakdowns.

### Extract metadata only
```bash
deepguard metadata <file> [--format json]
```
Extracts and displays EXIF, ICC profile, and embedded metadata without forensic analysis.

### Compare two images
```bash
deepguard compare <file1> <file2> [--output comparison.html]
```
Analyzes both images and creates a side-by-side comparison report.

## How It Works

DeepGuard combines multiple digital forensics techniques to detect manipulation:

### Error Level Analysis (ELA)
Resaves the image at a known JPEG quality and compares pixel-by-pixel differences. Edited regions show much higher error levels because they have different compression histories.

### Noise Pattern Analysis
Extracts high-frequency noise components using Laplacian filtering. Authentic photos have consistent noise patterns; spliced or edited regions show statistically anomalous noise.

### Metadata Forensics
Examines EXIF data for inconsistencies: mismatched camera/software, suspicious GPS coordinates, impossible timestamp sequences, compression metadata, and software used.

### Copy-Move Clone Detection
Uses DCT (Discrete Cosine Transform) block matching to find duplicated regions within an image. This technique catches copy-paste forgeries.

### Face Consistency Check
For images with faces, analyzes: eye reflection symmetry, skin texture uniformity, lighting consistency, edge blending artifacts, and presence of deepfake indicators.

### Compression Artifact Analysis
Maps JPEG block boundaries and compression artifacts. Authentic photos show consistent block patterns; edited regions often show boundary artifacts.

## Example Report Output

DeepGuard generates a beautiful HTML forensic report with:

- **Overall Verdict Badge** - AUTHENTIC (green), SUSPICIOUS (yellow), or MANIPULATED (red)
- **Confidence Scores** - 0-100% confidence for each technique
- **ELA Heatmap** - Visual representation of compression inconsistencies
- **Metadata Table** - All extracted EXIF and camera data
- **Technique Details** - Breakdown of each forensic analysis with findings
- **Recommendations** - Actionable next steps based on results
- **Timeline** - Camera and editing software timeline

All rendered as a self-contained dark-themed HTML file you can share or archive.

## System Requirements

- **Python:** 3.10 or higher
- **Memory:** 2GB RAM minimum (more for batch processing)
- **GPU:** Optional (cuda support for faster inference, but not required)
- **OS:** Linux, macOS, Windows

## Installation

### From PyPI (Recommended)
```bash
pip install deepguard
```

### From Source
```bash
git clone https://github.com/camilooscargbaptista/deepguard.git
cd deepguard
pip install -e .
```

## Usage Examples

### Basic Analysis
```bash
deepguard analyze suspicious_photo.jpg
```

### Save Report to Custom Location
```bash
deepguard analyze photo.jpg --output ~/reports/analysis.html
```

### Batch Analysis with JSON Export
```bash
deepguard batch ./evidence/ --output results.json --recursive
```

### Metadata Extraction
```bash
deepguard metadata photo.jpg --format json > metadata.json
```

### Image Comparison
```bash
deepguard compare original.jpg edited.jpg --output comparison.html
```

## Output Files

- `report.html` - Interactive forensic report (dark theme, self-contained)
- `report.json` - Machine-readable results
- Browser opens automatically to display the HTML report

## Understanding the Verdict

- **AUTHENTIC (Green)** - All techniques indicate the image is unmodified
- **SUSPICIOUS (Yellow)** - Some anomalies detected, but not conclusive
- **MANIPULATED (Red)** - Strong evidence of editing or deepfake artifacts

The manipulation score (0-100%) reflects how likely the image has been tampered with.

## Roadmap

| Version | Feature | Status |
|---------|---------|--------|
| v1.0 | ELA, Noise, Metadata, Copy-Move, Face Check | ✅ Released |
| v1.1 | Frequency Spectrum Analysis (FFT) | 🔜 Planned |
| v1.1 | JPEG Ghost Detection | 🔜 Planned |
| v2.0 | AI-Generated Image Detection (Neural) | 📋 Roadmap |
| v2.0 | GAN Fingerprint Analysis | 📋 Roadmap |
| v2.1 | PyPI Publishing | 📋 Roadmap |
| v2.1 | Docker Image | 📋 Roadmap |

> **Note:** Current v1.0 techniques are optimized for detecting traditional image editing (Photoshop, splicing, copy-paste). AI-generated image detection requires neural network-based analysis, planned for v2.0.

## Architecture Governance

This project uses [@girardelli/architect](https://github.com/camilooscargbaptista/architect) for continuous architecture analysis:

```bash
# Full architecture report
make architect

# Quick score check
make architect-score

# List anti-patterns
make architect-anti-patterns
```

## Limitations

- **AI-generated images**: Current techniques may not fully detect AI-generated content (planned for v2.0)
- Cannot recover original image content or identify specific edits
- Face analysis works best with forward-facing, well-lit faces
- PDF analysis limited to first page
- Heavily compressed images may reduce detection accuracy
- Cannot determine WHEN edits occurred, only IF they occurred

## Author

Created by Camilo Girardelli
IEEE Senior Member, Senior Software Architect
CTO at Girardelli Tecnologia

## License

MIT License 2026 - Camilo Girardelli / Girardelli Tecnologia

See LICENSE file for details.

## Contributing

Contributions are welcome! See CONTRIBUTING.md for guidelines.

## Disclaimer

DeepGuard is a forensic analysis tool for educational and investigative purposes. Results should be considered one data point among many. For legal proceedings, have findings verified by professional forensic experts.
