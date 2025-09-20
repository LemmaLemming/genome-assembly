#!/bin/bash

# This script automates the process of unzipping data files,
# running a Python script on them, and saving the results.

# --- Configuration ---
# List of data prefixes to process.
# Assumes your zip files are named data1.zip, data2.zip, etc.
DATA_SETS=("data1" "data2" "data3" "data4")

# The name of your Python script.
PYTHON_SCRIPT="main.py"

# The directory where results will be stored.
RESULTS_DIR="howards_results"

# --- Script Start ---
echo "Starting data processing..."

# Create the results directory if it doesn't already exist.
# The '-p' flag prevents an error if the directory is already there.
mkdir -p "$RESULTS_DIR"

# Loop through each data set in the list.
for data in "${DATA_SETS[@]}"
do
  echo "--- Processing: $data ---"

  # 1. Unzip the data file.
  # The '-o' flag overwrites existing files without asking.
  echo "Unzipping ${data}.zip..."
  unzip -o "${data}.zip"

  # 2. Call the Python script and redirect output.
  # The output of 'python main.py data1' will be saved to 'howards_results/data1.txt'.
  echo "Running Python script on $data..."
  python "$PYTHON_SCRIPT" "$data" > "${RESULTS_DIR}/${data}.txt"

  echo "Output saved to ${RESULTS_DIR}/${data}.txt"
done

echo "--- All processing complete! ✅ ---"