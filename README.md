# gimp-export-layers-scriptfu
GIMP - Export layers to separate files with a pure Script-Fu scheme.

## Installation
Place in GIMP's scripts folder, which will be something like `~/.config/GIMP/2.10/scripts`

## Usage
Run at command-line with `gimp`:

```
gimp -i -b '(export-layers "example_project.xcf" "./example_folder/")' -b '(gimp-quit 0)'
```

## Restrictions
This is hard-coded to export to .pbm files. This can be altered by changing Line 19 from `file-pbm-save` to a different file type.
Different functions can be found in GIMP's documentation.

It would be nice to use a function handle and pass the desired function as a parameter, but I do not know how to do this in LISP.
