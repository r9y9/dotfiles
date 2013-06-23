;; for emacs 24
;; ubuntu:
;; $ sudo apt-get install emacs24

;; Migu 1M
(set-face-attribute 'default nil :family "Migu 1M" :height 110)

;; package control
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

;; global key settings
(global-set-key (kbd "<f5>") (lambda () (interactive) (load-file "~/.emacs.d/init.el")))
(global-set-key (kbd "<f10>") 'list-packages)

