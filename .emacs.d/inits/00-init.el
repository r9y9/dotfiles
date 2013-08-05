;; for emacs 24
;; ubuntu:
;; $ sudo apt-get install emacs24

;; Ricty
(set-face-attribute 'default nil :family "Ricty" :height 100)

;; package control
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

;; global key settings
(global-set-key (kbd "<f5>") (lambda () (interactive) (load-file "~/.emacs.d/init.el")))
(global-set-key (kbd "<f10>") 'list-packages)

;; linum-mode
(global-linum-mode 1)
(setq linum-format "%4d ")
