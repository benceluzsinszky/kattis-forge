# KattisForge


This script automates the setup of a new Kattis problem environment. It creates a new folder with the appropriate files for the selected programming language (Java or Python), and opens the folder for you.


## Usage

1. **Run the script**: Execute the script in your command line interface.

2. **Setup the destination folder**: On the first run, you will be prompted to set up the destination folder.

## Note
The default location is `C:\Users\{username}\Documents\Kattis`.
If you use OneDrive, you might want to use `C:\Users\{username}\OneDrive\Documents\Kattis` instead.
You can always modify this path later in the `config.ini` file.

3. **Enter the Kattis problem name**: When prompted, enter the name of the Kattis problem you want to set up an environment for.

4. **Select the programming language**: Enter `J` or `Java` for Java, or `P` or `Python` for Python.

5. **Folder creation**: The script will create a new folder in the destination folder, with the name of the Kattis problem. It will also create the appropriate files for the selected programming language, and then open the new folder.

6. **Download sample inputs and outputs**: Download the sample inputs and outputs from  Kattis Problem --> Metadata --> Download Sample data files. Save them in the `sample` subfolder in the new problem folder.

7. **Solve the Kattis Problem!**

8. **Check your solution against the sampel inputs**: Run the `answerchecker.bat` script. It gives feedback on your solution in `main.py` or `Main.java`whether or not your output is the same as the expected output in the apropriate `.ans` file.



