# Resume template

This is a template of my resume. It is partially my development, partially forked from other repos

## Docs

### Customizing

First you'll want to fork the repo to your own account. Then clone it locally and customize, or use the GitHub web editor to customize.

#### Options/configuration

Most of the basic customization will take place in the `/_config.yml` file and in files under _data directory

#### CI CD Pipeline

If you want to publish your resume to a location different from the original repository, implement a post-commit hook
that takes contents of the build and copies commits into a different repo. Here is how I did it
```
#!/bin/bash -xv
#.git/hooks/post-commit
PUBLIC_REPO="~/source/imalinovsky.bitbucket.io"
PRIVATE_REPO=" ~/source/resume-template/"
echo "Executing $0"
source ~/.bashrc
cd $PRIVATE_REPO
bundle install
bundle exec jekyll build --destination $PRIVATE_REPO/public --trace
cd $PUBLIC_REPO
git pull
cp -r  $PRIVATE_REPO/public/* .
git add .
git commit -am "This commit is generated by CI pipeline"
git push
```

Bitbucket will host it for free if you create a repository called <your_username>.bitbucket.io. Put the contents
of the /public in the root of this repository. The URL will be https://<your_username>.bitbucket.io


## License

The code and styles are licensed under the MIT license. [See project license.](LICENSE) 
