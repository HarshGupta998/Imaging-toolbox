# Imaging-toolbox

# Denoising and Analysis MATLAB App

This MATLAB app allows users to select a .mat file containing 3D data, denoise the data using median filtering, and perform several analyses including calculating the mean square, group velocity, SWS map, and dispersion model.

## Features

- Select and load a .mat file containing 3D data.
- Denoise the selected data using 3D median filtering.
- Calculate and display the group velocity of the denoised data.
- Calculate and display the SWS map of the denoised data.
- Plot the dispersion image of the denoised data.
- Calculate and display the mean square value of the denoised data using the formula \(3qc^2\).

## Requirements

- MATLAB R2020a or later.
- MATLAB App Designer.

## Usage

1. **Select File**: Click the "Select File" button to open a file selection dialog and choose a .mat file containing 3D data. The variables in the .mat file will be loaded into the dropdown menu.

2. **Denoise**: After selecting a variable from the dropdown menu, click the "Denoise" button to denoise the selected 3D data using median filtering. The denoised data will be saved in a new folder with the same name as the original file.

3. **Group Velocity**: Click the "Group Velocity" button to calculate the group velocity of the denoised data. The result will be displayed in the "Group Velocity" text area.

4. **SWS Map**: Click the "SWS Map" button to calculate the SWS map of the denoised data. The result will be displayed in the "SWS Map" text area.

5. **Dispersion Imaging**: Click the "Dispersion Imaging" button to plot the dispersion image of the denoised data on the designated axis.

6. **Mean Square**: Click the "Mean Square" button to calculate the mean square value of the denoised data using the formula \(3qc^2\), where \(c\) is the mean velocity and \(q\) is a constant (1050). The result will be displayed in the "Mean Square" text area.

7. **Mean Score**: Click the "Mean Score" button to calculate the mean value of the denoised data. The result will be displayed in the "Mean Score" text area.

## Installation

1. Clone the repository to your local machine.
2. Open MATLAB and navigate to the directory where the repository is cloned.
3. Open the `app1_converted.mlapp` file in MATLAB App Designer.
4. Click the "Run" button to launch the app.

## User Interface

The app consists of the following components:

- **Select File Button**: A button to open a file selection dialog to choose a .mat file containing 3D data.
- **Variable DropDown**: A dropdown menu that displays the variables present in the selected .mat file.
- **Denoise Button**: A button to denoise the selected 3D data using median filtering and save the denoised data in a new folder.
- **Group Velocity Button**: A button to calculate the group velocity of the denoised data.
- **Group Velocity Text Area**: A text area to display the calculated group velocity.
- **SWS Button**: A button to calculate the SWS map of the denoised data.
- **SWS Text Area**: A text area to display the calculated SWS map.
- **Dispersion Imaging Button**: A button to plot the dispersion image of the denoised data.
- **Dispersion Axes**: An axis to plot the dispersion image.
- **Mean Square Button**: A button to calculate the mean square value of the denoised data.
- **Mean Square Text Area**: A text area to display the calculated mean square value.
- **Mean Score Button**: A button to calculate the mean score value of the denoised data.
- **Mean Score Text Area**: A text area to display the calculated mean score value.




 
Fig 1. User Interface
![alt text](image.jpg)

 
Fig 2. After Processing

## File Structure

- `app1_coonverted.mlapp`: The main app file created using MATLAB App Designer.
- `README.md`: This file.

## Notes

- Ensure that the .mat file you select contains 3D numeric data.
- The denoised data will be saved in a new folder with the same name as the original file, located in the same directory as the selected file.


