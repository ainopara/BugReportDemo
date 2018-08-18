# Collection of Demo for bug report

Demos are placed in different branches.

## Initialize

```
bundle install --path=${BUNDLE_PATH:-vendor/bundle}
```

## Command

```
bundle exec jekyll build
```

Output:
```
Configuration file: /Users/ainopara/Documents/Projects/BugReportDemo/_config.yml
            Source: /Users/ainopara/Documents/Projects/BugReportDemo
       Destination: /Users/ainopara/Documents/Projects/BugReportDemo/_site
 Incremental build: disabled. Enable with --incremental
      Generating...
             Error: could not read file /Users/ainopara/Documents/Projects/BugReportDemo/_posts/2018-05-31-Environment.textbundle/assets/SomeRandomImage1.png: invalid byte sequence in UTF-8
             Error: could not read file /Users/ainopara/Documents/Projects/BugReportDemo/_posts/2018-05-31-Environment.textbundle/assets/SomeRandomImage2.png: invalid byte sequence in UTF-8
                    done in 0.195 seconds.
 Auto-regeneration: disabled. Use --watch to enable.
```
Expecting: No error shown.

---

```
tree _site
```

Output:

```
_site
├── 2018
│   ├── 05
│   │   └── 31
│   │       ├── Environment.textbundle-info
│   │       │   └── index.json
│   │       └── Environment.textbundle-text
│   │           └── index.html
│   └── 06
│       └── 10
│           ├── Code-Organization.textbundle-info
│           │   └── index.json
│           └── Code-Organization.textbundle-text
│               └── index.html
├── README.md
├── about
│   └── index.html
├── assets
│   ├── main.css
│   └── minima-social-icons.svg
├── feed.xml
└── index.html

11 directories, 10 files
```

Expecting: index.json and index.html should be ignored.
