## Debugging Javascript

At the moment, most of the JavaScript applications we've written have been fairly simple, and most have not been longer than a hundred lines. As applications and websites get more and more complex, we need increasingly powerful tools to help us detect bugs, typos, implementation errors – and fix them quickly and efficiently.

We've already been using the **Chrome Developer Tools**, but today we'll dive deeper into some of the features we can use to debug JavaScript.

## Using Chrome dev tools to debug JavaScript

#### The Sources Panel

Open the starter code in Chrome and make sure the chrome dev-tools panel is open. Go to the Sources panel.

The Sources panel helps us visualize what's going on when we load JavaScript code. It provides a way for us to debug our code in an interactive way. Follow the steps below to explore the Sources panel:

```
cmd+alt+j
```

- If it is not already selected, select **Sources**.

Take a look:

![chrome](http://s6.postimg.org/5fwewzf0h/298740c0_175f_11e5_84a1_f8c88c3e607a.jpg)

Schema From [Chrome dev tools Website](https://developer.chrome.com/devtools/docs/javascript-debugging)

#### Debugging with breakpoints

A breakpoint is an instruction given to a program via a keyword to pause the execution of a script. The Chrome dev tools let you pause execution of a script and see what's going on.

#### Add and remove breakpoint

On the left side of the panel, click on a line number where you want to stop the execution of the code. The line number will be highlighted with a blue arrow to show the breakpoint.

**Multiple breakpoints**

You can add several breakpoints in the scripts, and everytime a breakpoint is set, the execution will stop. You can enable and disable the breakpoints using the checkboxes on the right sidebar.

It is possible to access a breakpoint by clicking on it in the source on the left.

A breakpoint can be removed by clicking on the blue arrow on the left.

#### Debugger keyword

Another way of setting breakpoints in the code is to use the `debugger` keyword. If the console is open and the interpreter is going through a line in the code that contains `debugger`, then the console will highlight this line and the console will be in the context of the `debugger`.

```javascript
debugger

setTimeout(function(){
  alert("Loaded");
}, 0);
```

The DevTools console drawer will allow you to experiment within the scope of where the debugger is currently paused. Hit the **Esc** key to bring the console into view. The Esc key also closes this drawer.

#### Execution control

The execution control buttons are located at the top of the side panels and allow you to step through code. The buttons available are:

- **Continue**: continues code execution until we encounter another breakpoint.
- **Step over**: step through code line-by-line to get insights into how each line affects the variables being updated. Should your code call another function, the debugger won't jump into its code, instead stepping over so that the focus remains on the current function.
- **Step into**: like Step over, however clicking Step into at the function call will cause the debugger to move its execution to the first line in the functions definition.
- **Step out**: having stepped into a function, clicking this will cause the remainder of the function definition to be run and the debugger will move its execution to the parent function.
- **Toggle breakpoints**: toggles breakpoints on/off while leaving their enabled states intact.

There are also several related keyboard shortcuts available in the Sources panel:

| Execution | Shortcut |
|-----------|----------|
| Continue | `F8` or `Command + /` |
| Step over | `F10` or `Command+'` |
| Step into | `F11` or `Command+;`  |
| Step out | `Shift+F11` or `Shift+Command+;` |
| Next call frame | `Ctrl+.` |
| Previous call frame | `Ctrl+,` |

