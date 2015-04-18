;; Default font

(set-face-attribute 'default nil :family "Ricty" :height 105)

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

;; Delete trailing whitespace
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; DO NOT create backup files
(setq make-backup-files nil)
(setq auto-save-default nil)
