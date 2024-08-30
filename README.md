# Template
To start setting up a translation project, please follow this template to help you get started as quick as possible!  

## README Setup
Please use this template when making your `README.md`  
Change `Template` to your game's name and the hash to the non-nkit iso's SHA1 hash.  
This template may change in the future, the structure, information, compiling steps, etc. so check back here to update your README!
```
# Template
- File: `Template [J].iso`
- Hash: `0000000000000000000000000000000000000000`


## Patching
#### xdelta patch (Recommended)
- Download [Delta Patcher](https://www.romhacking.net/utilities/704/)
- Grab the [latest release](https://github.com/DOL-Translations/template/releases/latest/)
- Open Delta Patcher and add the translation xdelta patch and the required language iso.
#### manual patch (Latest changes, Windows only)
- Drop the required language iso (non-nkit compressed) into the `input` folder.
    - Make sure it is named properly! Refer to the header of the readme for more info.
- Run `compile.bat` in the `tools` folder.
```

## Project Setup
#### .vscode/
The `.vscode/` folder contains a `tasks.json` which is used to compile the project from within Visual Studio Code. 

#### input/ and output/
The `input/` and `output/` folders should remain unnamed for consistency between other projects found here. the `input/` folder is for untranslated isos and `output/` is what BASS will spit out when it finishes compiling all changes.  

#### src/
The layout of the `src/` folder should be as follows:
- Your `src` folder MUST contain a `Main.asm` (capitalized) for consistency
- If replacing any file, make a folder called `fs` and directly replicate the folder structure of the game you are replacing the files in
- Add `include` lines on the end of the file to use multiple `.asm` files for readability

#### tools/
As of now, ARM9's BASS is included in the `tools/bass` folder and comes default with the Windows version in `tools/bass/win`.
To patch the source file, run `tools/compile.bat`

#### .gitignore
Please please please keep the `.gitignore` to at least having `*.iso` to avoid publishing copyrighted materials. Users must obtain their own iso and will not rely on our repositories for these files.  Code files such as `*.dol` and `*.rel`, and large archive files should also not be included.

## Changes Required
The `.vscode/` folder contains a `tasks.json`, you typically just need to rename the task's label if you follow the `src/` structure unless you add new things into the project that rely on a task.  

The file `src/Main.asm` will read the iso in `input/` but the line needs to be changed to reflect which game you will be translation. Please adjust this line. You will also need to change the line for the `output/` when finished.

The batch file `tools/compile.bat` will need to also be updated to reflect the name of your input file. The batch file may be edited for use of external tools, multi-disc games, and multi-platform games.
