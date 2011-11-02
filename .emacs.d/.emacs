                                        ; load local Lisp (Emacs scripts)
(add-to-list 'load-path "~/.emacs.d/site-lisp/")

                                        ; show trailing white space
(setq-default show-trailing-whitespace t)

                                        ; spaces only; no tabs
(setq-default indent-tabs-mode nil)

                                        ; 2 space tabs for JavaScript
(setq-default js-indent-level 2)

                                        ; immediately, automatically indent on RET
(global-set-key (kbd "RET") 'newline-and-indent)

                                        ; Fix some Ruby formatting issues
;;(add-hook 'ruby-mode-hook (lambda() (local-set-key "\r" 'newline-and-indent)))


                                        ; Fix PHP support
(require 'php-mode)

                                        ; railscasts color theme from https://github.com/olegshaldybin/color-theme-railscasts
(require 'color-theme)
(color-theme-initialize)
(load-file "~/.emacs.d/site-lisp/themes/color-theme-railscasts.el")
(color-theme-railscasts)




                                        ; settings from Custom
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#232323" :foreground "#E6E1DC" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 110 :width normal :foundry "unknown" :family "Ubuntu Mono")))))


;;; This was installed by package-install.el.
;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
;;; Move this code earlier if you want to reference
;;; packages in your .emacs.
(when
    (load
     (expand-file-name "~/.emacs.d/elpa/package.el"))
  (package-initialize))
