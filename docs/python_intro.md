# Introduction


`Welcome page and syllabus <https://uppmax.github.io/HPC-python/index.html>`_
   - Also link at House symbol |:house:| at top of page 

**Learning outcomes**
   
   - Load Python modules and site-installed Python packages
   - Create a virtual environment
   - Install Python packages with pip (Kebnekaise, Rackham, Snowy)
   - Install Python packages with conda (Bianca)
   - Write a batchscript for running Python
   - Use Python in parallel
   - Use Python for ML
   - Use GPUs with Python

<div id="tabs">
  <ul>
    <li><a href="#fragment-1">One</a></li>
    <li><a href="#fragment-2">Two</a></li>
    <li><a href="#fragment-3">Three</a></li>
  </ul>
  <div id="fragment-1">
    Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.
  </div>
  <div id="fragment-2">
    Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.
  </div>
  <div id="fragment-3">
    Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.
  </div>
</div>

````` tabs
```` tab "Mac"

- Start terminal (e.g. from Launchpad) or [iTerm2](https://iterm2.com/)
```bash=
$ ssh <username>@rackham.uppmax.uu.se
```
- "< >" prompts you to set the keyword specific for you or your needs. In the example above, this is basically your username.

![Terminal](./img/Mac_terminal.png)
- iTerm2 goodies:
  - You can save hosts for later.
  - Drag and drop scp
```
````

```` tab "Windows"

- the ssh (secure shell) client [**putty**](https://www.putty.org/) is sufficient first days of the course!

    - You can save hosts for later.
    - No graphics.
    - 
    
- Windows Powershell terminal can also work

    - Cannot save hosts
    - no graphics
    - [PowerShell](https://learn.microsoft.com/en-us/powershell/)
    
- Windows command prompt can also work

    - Cannot save hosts
    - no graphics
    - [Command Prompt](https://www.makeuseof.com/tag/a-beginners-guide-to-the-windows-command-line/))

- [Git bash](https://gitforwindows.org/)

}
```
````
`````

## Tabs 

```curl
$ curl -O wget http://example.com/pk.zip
```

```wget
$ wget http://example.com/pk.zip
```

## Single block

```
$ ls -lisa
```


=== "Tab 1"
    Markdown **content**.

    Multiple paragraphs.

=== "Tab 2"
    More Markdown **content**.

    - list item a
    - list item b

=== "C"

    ``` c
    #include <stdio.h>

    int main(void) {
      printf("Hello world!\n");
      return 0;
    }
    ```

=== "C++"

    ``` c++
    #include <iostream>

    int main(void) {
      std::cout << "Hello world!" << std::endl;
      return 0;
    }
    ```
