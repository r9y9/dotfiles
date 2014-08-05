;; for emacs 24
(add-to-list 'load-path "~/.emacs.d/elpa/init-loader")
(require 'init-loader)

(add-to-list 'load-path "~/.emacs.d/manually_installed")

(setq init-loader-show-log-after-init nil)
(init-loader-load "~/.emacs.d/inits")
