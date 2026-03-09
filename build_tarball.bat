robocopy dist\angular-tree-component dist_package\package /E /IS
cd dist_package
del angular-tree-component-19.1.2-scroll-fix.tgz
7z a -ttar package.tar package\
7z a -tgzip angular-tree-component-19.1.2-scroll-fix.tgz package.tar
del package.tar
