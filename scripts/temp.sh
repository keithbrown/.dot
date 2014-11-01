# checkout gh-pages
git checkout gh-pages
[ $? -eq 0 ] || abort

# move the new distribution
git show master:dist/dot.tgz > dot.tgz
[ $? -eq 0 ] || abort

# commit
git add .
[ $? -eq 0 ] || abort
git commit -m "Updated distribution from `git show-ref -s --abbrev --heads master`"
[ $? -eq 0 ] || abort
git push origin gh-pages
[ $? -eq 0 ] || abort

# checkout master
git checkout master
[ $? -eq 0 ] || abort
