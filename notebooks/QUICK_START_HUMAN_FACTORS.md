# Quick Start Guide - Human Factors Analysis

## Installation (5 minutes)

```bash
# Navigate to the notebooks directory
cd notebooks

# Install additional requirements
pip install torch transformers plotly kaleido ipywidgets scipy
```

## Running the Analysis (2-3 hours on GPU)

### Option 1: Run All Cells
1. Open `07_human_factors_analysis.ipynb`
2. Select "Run All" from the menu
3. The notebook will automatically:
   - Detect GPU/CPU
   - Load the model (first run: ~5 min download)
   - Process all 87,951 records
   - Generate 6 visualizations
   - Export all outputs

### Option 2: Run Step-by-Step
Execute cells sequentially to understand each stage:
1. **Cells 1-5**: Setup and configuration
2. **Cells 6-7**: Model loading
3. **Cells 8-9**: Checkpoint system
4. **Cells 10-14**: Data loading and classification
5. **Cells 15-21**: HFACS ontology mapping
6. **Cells 22-26**: Validation system
7. **Cells 27-28**: Statistical analysis
8. **Cells 29-35**: Visualizations
9. **Cells 36-38**: Export and summary

## Quick Validation (Optional)

After classification completes, uncomment in cell 26:

```python
validation_ui = ValidationUI(validation_sample, batch_size=20)
validation_ui.display()
```

Then review cases interactively and save validated labels.

## Expected Outputs

### Data Files (../data/)
✅ `human_factors_annotated.csv` - 87,951 records with labels
✅ `human_factors_ontology.json` - Taxonomy with temporal evolution
✅ `human_factors_validation_review.csv` - Top 200 priority cases
✅ `human_factors_summary.json` - Summary statistics
✅ `processing_log.json` - Processing metadata

### Visualizations (../presentation_assets/)
✅ `14_human_factors_sankey.png` - 4-layer flow diagram
✅ `14_human_factors_forest_plot.png` - Odds ratios
✅ `14_human_factors_geographic_kde.png` - Geographic distribution
✅ `14_human_factors_temporal_correlation.png` - Correlations by decade
✅ `14_human_factors_prevalence_trends.png` - Temporal trends
✅ `14_human_factors_dendrogram.png` - Hierarchical clustering

### Checkpoints (../data/checkpoints/)
✅ Automatic saves every 2,000 records
✅ Milestones every 10,000 records

## Resuming After Interruption

If the notebook is interrupted:
1. Re-run from the beginning
2. When prompted, type `y` to resume from checkpoint
3. Processing continues from last saved position

## Common Issues

### Issue: Out of Memory
**Solution**: Automatic! The notebook reduces batch size automatically.

### Issue: Model download fails
**Solution**: 
```bash
# Pre-download model
python -c "from transformers import pipeline; pipeline('zero-shot-classification', model='facebook/bart-large-mnli')"
```

### Issue: Visualizations not saving
**Solution**:
```bash
pip install --upgrade kaleido pillow
```

### Issue: Interactive UI not showing
**Solution**: 
- VS Code: Install Jupyter extension
- Jupyter Lab: `jupyter labextension install @jupyter-widgets/jupyterlab-manager`

## Performance Tips

### Speed Up Processing
1. **Use GPU**: 6-8x faster than CPU
2. **Close other programs**: Free up RAM
3. **Disable visualization previews**: Comment out `fig.show()` lines

### Reduce Memory Usage
1. **Lower batch size**: Modify `BATCH_SIZES` in Config class
2. **Process subset**: Use `df.head(10000)` for testing
3. **Clear checkpoints**: Delete old checkpoints to free disk space

## Customization

### Change Classification Threshold
In cell 3, modify:
```python
CLASSIFICATION_THRESHOLD = 0.4  # Default
# Try: 0.3 (more sensitive) or 0.5 (more strict)
```

### Add Custom Human Factors
In cell 3, add to `HUMAN_FACTORS_LABELS`:
```python
HUMAN_FACTORS_LABELS = [
    # ... existing labels ...
    "your custom factor"
]
```

### Adjust Priority Weights
In cell 3, modify `PRIORITY_WEIGHTS`:
```python
PRIORITY_WEIGHTS = {
    "imc": 3.0,      # Increase for more IMC emphasis
    "fatal": 2.0,    # Increase for more fatal emphasis
    "regex": 1.5,
    "low_confidence": 1.0,
    "reciprocating": 0.5
}
```

## Testing (5 minutes)

Test on small subset before full run:

```python
# In cell 12, replace:
df_to_process = df[df['analysis_clean'].notna()].copy()
# With:
df_to_process = df[df['analysis_clean'].notna()].head(1000).copy()
```

This processes only 1,000 records (~5 min) to verify everything works.

## Getting Help

1. **Check logs**: View `processing_log.json` for errors
2. **Read full README**: See `HUMAN_FACTORS_README.md`
3. **Check cell outputs**: Look for ✓ success or ❌ error messages
4. **Verify inputs**: Ensure `enriched_ntsb_nlp.csv` exists

## Next Steps After Completion

1. **Review Results**:
   - Open `human_factors_summary.json`
   - Check visualization PNGs
   - Inspect `human_factors_annotated.csv`

2. **Validate (Optional)**:
   - Run interactive validation UI
   - Review top 200 priority cases
   - Export manual labels

3. **Integrate**:
   - Use annotated data in other notebooks
   - Incorporate into predictive models
   - Include visualizations in presentations

## Time Estimates

| Task | GPU | CPU |
|------|-----|-----|
| Setup | 5 min | 5 min |
| Model load | 5 min | 5 min |
| Classification | 2-3 hours | 12-16 hours |
| Statistical analysis | 5 min | 10 min |
| Visualizations | 10 min | 15 min |
| **Total** | **~3 hours** | **~13 hours** |

## Resource Requirements

| Resource | Minimum | Recommended |
|----------|---------|-------------|
| RAM | 16 GB | 32 GB |
| GPU VRAM | 8 GB | 12 GB+ |
| Disk Space | 5 GB | 10 GB |
| Python | 3.8+ | 3.10+ |

## Success Indicators

✅ GPU detected and model loaded
✅ No OOM errors (or auto-recovered)
✅ All 87,951 records processed
✅ 6 PNG files in presentation_assets/
✅ 5+ data files in data/
✅ Final success message displayed

## Contact

For issues or questions, refer to the main project documentation or check cell outputs for specific error messages.
