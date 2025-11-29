# Human Factors Analysis Notebook

## Overview
`07_human_factors_analysis.ipynb` implements a comprehensive human factors analysis using zero-shot multi-label classification mapped to the HFACS (Human Factors Analysis and Classification System) taxonomy.

## Features

### 1. Zero-Shot Multi-Label Classification
- **Model**: facebook/bart-large-mnli
- **Labels**: 7 human factors
  1. Spatial disorientation
  2. Poor decision-making
  3. Failure to take corrective action
  4. Loss of control in flight
  5. Inadequate training or proficiency
  6. Loss of situational awareness
  7. Procedural violation or non-compliance
- **Threshold**: 0.4 for positive classification

### 2. HFACS Ontology Mapping
**Level 1 - Unsafe Acts:**
- Decision Errors
- Skill-Based Errors
- Perceptual Errors
- Violations

**Level 2 - Preconditions:**
- Training

### 3. Adaptive GPU Batching
- Automatic batch size reduction on OOM: 500 → 250 → 125 → 64 → 32
- GPU/CPU auto-detection
- Memory management and cache clearing

### 4. Checkpoint System
- **Incremental checkpoints**: Every 2,000 records (`batch_{num}.pkl`)
- **Milestone checkpoints**: Every 10,000 records (`milestone_{num}.pkl`)
- **Auto-resume**: Restart from last checkpoint on interruption
- **Processing log**: `processing_log.json` with metadata

### 5. Validation System
- **Priority scoring** based on:
  - IMC conditions (×3.0)
  - Fatal accidents (×2.0)
  - Regex matches (×1.5)
  - Low confidence predictions (×1.0)
  - Reciprocating engine (×0.5)
- **Top 200 cases** selected for validation
- **Interactive UI** with ipywidgets:
  - Highlighted narratives (regex matches)
  - Model predictions displayed
  - 7 checkboxes for manual labeling
  - Save/Skip/Previous/Export buttons

### 6. Statistical Analysis
- Contingency tables
- Odds ratios with 95% confidence intervals
- Chi-square tests
- Fisher's z-test for temporal correlation changes
- Temporal analysis by decade

### 7. Visualizations (300 DPI)
1. **Sankey Diagram**: 4-layer flow (factors → HFACS → weather → outcomes)
2. **Forest Plot**: Odds ratios with confidence intervals
3. **Geographic KDE**: Kernel density estimation overlay
4. **Temporal Correlation Grid**: Heatmaps by decade with Fisher's z
5. **Prevalence Trends**: Line plots showing temporal evolution
6. **HFACS Dendrogram**: Hierarchical clustering

## Installation

### Basic Requirements
```bash
cd notebooks
pip install -r requirements.txt
pip install -r requirements_human_factors.txt
```

### GPU Support (Optional but Recommended)
```bash
# For CUDA 11.8
pip install torch --index-url https://download.pytorch.org/whl/cu118

# For CUDA 12.1
pip install torch --index-url https://download.pytorch.org/whl/cu121
```

## Usage

### Running the Full Analysis
```python
# Simply run all cells in sequence
# The notebook will:
# 1. Auto-detect GPU/CPU
# 2. Load the model
# 3. Check for existing checkpoints
# 4. Process all 87,951 records
# 5. Generate visualizations
# 6. Export all outputs
```

### Resuming from Checkpoint
If interrupted, the notebook will:
1. Detect the latest checkpoint
2. Prompt to resume or start fresh
3. Continue from last processed index

### Interactive Validation
To use the validation UI:
```python
# Uncomment in the notebook:
validation_ui = ValidationUI(validation_sample, batch_size=20)
validation_ui.display()
```

Then:
1. Review each case's narrative (highlighted key terms)
2. Check/uncheck applicable human factors
3. Click "Save" to record labels
4. Use "Previous" to go back
5. Click "Export & Exit" when done

## Outputs

### Data Files
- `data/human_factors_annotated.csv` - 87,951 records with 7 binary labels + scores
- `data/human_factors_ontology.json` - Versioned taxonomy (v1.0.0)
- `data/human_factors_validation_review.csv` - Top 200 priority cases
- `data/manual_labels.csv` - Validated labels (after interactive UI)
- `data/processing_log.json` - Processing metadata
- `data/human_factors_summary.json` - Summary statistics

### Visualizations (300 DPI)
All saved to `presentation_assets/`:
- `14_human_factors_sankey.png`
- `14_human_factors_forest_plot.png`
- `14_human_factors_geographic_kde.png`
- `14_human_factors_temporal_correlation.png`
- `14_human_factors_prevalence_trends.png`
- `14_human_factors_dendrogram.png`

### Checkpoints
Saved to `data/checkpoints/`:
- `batch_2000.pkl`, `batch_4000.pkl`, etc.
- `milestone_10000.pkl`, `milestone_20000.pkl`, etc.

## Data Schema

### Input
- **File**: `data/enriched_ntsb_nlp.csv`
- **Required columns**: 
  - `analysis_clean` (text for classification)
  - `event_id`, `event_date`, `year`
  - `weather_condition`, `aircraft_damage`
  - `total_fatal_injuries`, `total_serious_injuries`
  - `engine_type`, `longitude`, `latitude`

### Output Columns Added
For each human factor (e.g., "spatial disorientation"):
- `spatial_disorientation` - Binary (0/1)
- `spatial_disorientation_score` - Float (0.0-1.0)

HFACS categories:
- `hfacs_l1_decision_errors` - Binary
- `hfacs_l1_skill_based_errors` - Binary
- `hfacs_l1_perceptual_errors` - Binary
- `hfacs_l1_violations` - Binary
- `hfacs_l2_preconditions_training` - Binary

Validation:
- `regex_spatial_disorientation` through `regex_violation` - Binary
- `regex_strength` - Integer (sum of regex matches)
- `priority_score` - Float
- `is_IMC`, `is_fatal`, `is_reciprocating` - Binary

## Technical Details

### Model Information
- **Architecture**: BART (Bidirectional and Auto-Regressive Transformers)
- **Size**: Large (406M parameters)
- **Task**: Zero-shot classification
- **Multi-label**: Yes (can predict multiple labels per text)
- **License**: MIT

### Regex Patterns
```python
spatial_disorientation: r"\b(spatial\s*disorientation|vertigo|visual\s*illusion)\b"
poor_decision: r"\b(poor\s*decision|misjudg(ed|ment))\b"
corrective_action: r"\b(elected\s*to\s*continue|failed\s*to\s*(go\s*around|divert))\b"
loss_of_control: r"\b(loss\s*of\s*control|stall|spin|spiral)\b"
training: r"\b(inadequate\s*training|lack\s*of\s*(experience|proficiency))\b"
situational_awareness: r"\b(loss\s*of\s*situational\s*awareness|unaware)\b"
violation: r"\b(violation|non-compliance|failed\s*to\s*comply)\b"
```

### Priority Score Formula
```
priority_score = (is_IMC × 3.0) + 
                 (is_fatal × 2.0) + 
                 (regex_strength × 1.5) + 
                 (low_confidence × 1.0) + 
                 (is_reciprocating × 0.5)
```

### Fisher's z-Test
Used to detect significant temporal changes in correlations:
```
z = (z1 - z2) / sqrt(1/(n1-3) + 1/(n2-3))
where z1 = arctanh(r1), z2 = arctanh(r2)
```

## Performance

### Expected Runtime
- **GPU (RTX 3090)**: ~2-3 hours for 87,951 records
- **CPU**: ~12-16 hours for 87,951 records
- **Checkpoint overhead**: ~5-10 seconds per save

### Memory Requirements
- **GPU VRAM**: 10-12 GB (with batch_size=500)
- **System RAM**: 16 GB minimum, 32 GB recommended
- **Disk space**: ~5 GB for checkpoints + outputs

## Troubleshooting

### Out of Memory Errors
The notebook automatically handles OOM by:
1. Catching the error
2. Reducing batch size
3. Clearing GPU cache
4. Retrying from last successful batch

Manual intervention needed only if batch_size=32 still fails.

### Checkpoint Issues
If checkpoints are corrupted:
```bash
rm -rf data/checkpoints/*
# Then restart the notebook
```

### Visualization Errors
For Sankey diagram issues:
```bash
pip install --upgrade plotly kaleido
```

For matplotlib issues:
```bash
pip install --upgrade matplotlib pillow
```

### Interactive UI Not Displaying
In Jupyter Lab:
```bash
jupyter labextension install @jupyter-widgets/jupyterlab-manager
```

In VS Code:
- Ensure Jupyter extension is installed
- Use "Jupyter: Create Interactive Window" command

## Citation

If using this analysis in publications:

```bibtex
@software{human_factors_analysis_2024,
  title={Human Factors Analysis of NTSB Aviation Accidents},
  author={DATA-613 Aviation Safety Analysis Project},
  year={2024},
  note={Zero-shot multi-label classification with HFACS mapping}
}
```

## License
This notebook is part of the DATA-613 Aviation Safety Analysis project.

## Contact
For questions or issues, please refer to the main project README.
