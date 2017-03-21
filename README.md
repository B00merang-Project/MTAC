# Modular Theme Architecture and Compiler

![logo](http://b00merang.weebly.com/uploads/1/6/8/1/16813022/published/mtac.png?1490106189)

This script was created with the goal of facilitating the maintenance to the B00merang Redmond, Longhorn, Whistler and XP Themes. All material inluded is licensed under GPL v3 license.

### How it works
The execute script will compile, assemble, include shell themes (when available) and compress the theme based on the parmeter you give it. You can also compile only the gtk-3.0/3.20 folders if you want.

### Why not use SASS?
The SASS architecture is more flexible and powerful than our current software. However, the syntax of SASS differs from the 'pure' CSS and the resulting project will be a gresource file. However, we want to make the source code easily available for everyone and that's why we are doing this project.

### Why Modular?
The 'code tree' (code reused by all our themes) is stored in resources/common and is reused for the major parts of the structure that don't need specific theming. In the code tree are included INSERTION nodes (syntax: !---widget_name---!) that will be replaced by the corresponding widget code on compilation. You can therefore insert, alter or remove parts of the tree and recompile the whole set of themes without having to patch 12 themes one by one.

You can also insert specific code to a particular theme (for example: the combobutton in Whistler theme is unique). Because the widget theming is specific (each theme can get their own custom code without affecting the other themes) it can be a simple way of differentiating otherise very similar themes.

Finally, the compilation and assemlbly processes are flexible and can easily be edited. However, if you want to add a functionality or an extra operation OUTSIDE OF THE ASSEMBLY OR COMPILATION, please write it in a dedicated script and store it in 'scripts'. It will help keep the software clean and free of bugs.

### Why are you guys changing this script so much?
Because we're simplifying the process.

### Can I adapt other themes to this program?
Short answer is yes, though you will have to adapt the source code according to the hierarchy of our code tree.
