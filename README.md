# Modular Theme Architecture and Compiler

This script was created with the goal of facilitating the maintenance to the B00merang Redmond Themes, the Longhorn Themes, the Whistler Theme and the XP Themes. All material inluded is licensed under GPL v3 license but 

### How it works
The execute script will compile, assemble, include shell themes (when available) and compress the theme based on the parmeter you give it. You can also compile only the gtk-3.0/3.20 folders if you want.

### Why Modular?
The 'code tree' (code reused by all our themes) is stored in resources/common and is injected in harmony with the code that is unique to each theme (some may share some code, specially XP themes). You can therefore insert or remove parts of the tree and recompile the whole set of themes without having to patch 12 themes one by one.

You can also insert specific code to a particular theme (for example: the combobutton in Whistler theme is unique to itself). Finally, the compilation and assemlbly processes are flexible and can easily be edited. However, if you want to add a functionality or an extra operation OUTSIDE OF THE ASSEMBLY OR COMPILATION, please write it in a dedicated script and store it in 'scripts'. It will help keep the software clean and free of bugs.

### Can I adapt other themes to this program?
Short answer is yes, though you will have to adapt the source code according to the hierarchy of our code tree (keep files src_10 and 11 empty, it's a small bug we're soon going to solve).
