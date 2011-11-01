                                        ; load local Lisp (Emacs scripts)
(add-to-list 'load-path "~/.emacs.d/site-lisp/")

                                        ; show trailing white space
(setq-default show-trailing-whitespace t)

                                        ; spaces only; no tabs
(setq-default indent-tabs-mode nil)

                                        ; 2 space tabs for JavaScript
(setq-default js-indent-level 2)

                                        ; railscasts color theme from https://github.com/olegshaldybin/color-theme-railscasts
(require 'color-theme)
(color-theme-initialize)
(load-file "~/.emacs.d/site-lisp/themes/color-theme-railscasts.el")
(color-theme-railscasts)

                                        ; settings from Custom
(custom-set-variables
 '(inhibit-startup-screen t))

